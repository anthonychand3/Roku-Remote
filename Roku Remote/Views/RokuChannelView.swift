//
//  RokuChannelView.swift
//  Roku Remote
//
//  Created by anthony chand on 3/12/22.
//

import SwiftUI
import SWXMLHash

struct RokuChannelView: View {
    @State private var cards: [Card] = []
    @State private var apiRoutes: ApiRoutes?
    
    private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack{
            Text("Avaliable Channels").font(.largeTitle).foregroundColor(Color.white).frame(width: 300, height: 25, alignment: .topLeading)
            ScrollView(.vertical){
                LazyVGrid( columns: columns, spacing: 16) {
                    ForEach(self.cards) { card in
                        CardView(title: card.title, id: card.appId)
                            .frame(height: 100).onTapGesture(perform: {
                                launchApp(id: card.appId)
                                let userDefaults = UserDefaults.standard
                                if userDefaults.object(forKey: "recentlyViewed") == nil {
                                    do{
                                        let encoder = JSONEncoder()
                                        let data = try encoder.encode(card)
                                        
                                        userDefaults.set([data], forKey: "recentlyViewed")
                                    }catch{
                                        print("error encoding")
                                    }
                                    
                                }else{
                                    var data = userDefaults.array(forKey: "recentlyViewed")
                                    do {
                                        let decoder = JSONDecoder()
                                        for encodedCard in data! {
                                            let tempCard = try decoder.decode(Card.self, from: encodedCard as! Data)
                                            if tempCard.appId == card.appId {
                                                let indexOfData = data?.firstIndex(where: {$0 as! Data == encodedCard as! Data})
                                                data?.remove(at: indexOfData!)
                                            }
                                        }
                                        
                                        let encoder = JSONEncoder()
                                        let tempData = try encoder.encode(card)
                                        data?.insert(tempData, at: 0)
                                        userDefaults.set(data, forKey: "recentlyViewed")
                                    } catch {
                                        print("Unable to Decode card (\(error))")
                                    }
                                }
                            })
                    }
                }
            }
        }.background(Color.black).foregroundColor(Color.black).onAppear(){
            Task {
                await processApps()
            }
        }
    }
    
    func processApps() async {
        Task{
           apiRoutes = ApiRoutes()
            if apiRoutes!.deviceIpAddress != nil{
                print("not nil")
                await apiRoutes!.getDeviceApps(){
                    Output in
                    self.cards = Output
                }
            }
        }
    }
    
    func launchApp(id: String){
        apiRoutes!.launchApp(id: id)
    }
}

struct Card: Identifiable, Codable {
    let id: UUID
    let title: String
    let appId: String
}

struct CardView: View {
    let title: String
    let id: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "http://" + UserDefaults.standard.string(forKey: "ipAddress")! + ":8060/query/icon/" + id)) { image in
                image.resizable()
            } placeholder: {
                Color.black
            }
            .frame(width: 94, height: 94)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        
    }
}

struct RokuChannelView_Previews: PreviewProvider {
    static var previews: some View {
        RokuChannelView()
    }
}
