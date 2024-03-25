//
//  HomeView.swift
//  Roku Remote
//
//  Created by anthony chand on 3/12/22.
//

import SwiftUI

struct HomeView: View {
    @State private var cards: [Card] = []
    let apiRoutes = ApiRoutes()

    private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack{
            Text("Recent Channels").font(.largeTitle).foregroundColor(Color.white).frame(width: 300, height: 25, alignment: .topLeading)
            ScrollView(.vertical){
                LazyVGrid( columns: columns, spacing: 16) {
                    ForEach(self.cards) { card in
                        CardView(title: card.title, id: card.appId)
                            .frame(height: 100).onTapGesture(perform: {
                                launchApp(id: card.appId)
                            })
                    }
                }
            }
        }.background(Color.black).foregroundColor(Color.black).onAppear(){
            let data = UserDefaults.standard.array(forKey: "recentlyViewed")
            if data != nil {
                do {
                    let decoder = JSONDecoder()
                    cards.removeAll()
                    for encodedCard in data! {
                        let tempCard = try decoder.decode(Card.self, from: encodedCard as! Data)
                        cards.append(tempCard)
                    }
                } catch {
                    print("Unable to Decode card (\(error))")
                }
            }
        }
    }

    func launchApp(id: String){
        apiRoutes.launchApp(id: id)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
