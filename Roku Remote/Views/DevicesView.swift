//
//  DevicesView.swift
//  Roku Remote
//
//  Created by anthony chand on 3/12/22.
//

import SwiftUI
import SWXMLHash

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

struct DeviceView: View {
    private var apiRoutes: ApiRoutes?
    private var deviceInfo: XMLIndexer?
    @Binding private var deviceXML: String
    
    init(deviceXML: Binding<String>){
        print("loading view")
        _deviceXML = deviceXML
        deviceInfo = XMLHash.parse(deviceXML.wrappedValue)

    }
    
    var body: some View {
        ZStack{
            Rectangle().fill(.gray).cornerRadius(10)
            HStack{
                Image(systemName: "externaldrive").resizable().aspectRatio(contentMode: .fit).foregroundColor(.white).frame(width: 90, height: 38)
                Spacer()
                VStack{
                    HStack{
                        if deviceInfo!["device-info"]["power-mode"].element!.text == "PowerOn" {
                            Image(systemName: "circle.fill").resizable().foregroundColor(.green).frame(width: 10, height: 10)
                            Text("connected").foregroundColor(.white)
                        }
                        else {
                            Image(systemName: "circle.fill").resizable().foregroundColor(.red).frame(width: 10, height: 10)
                            Text("Not Found on Network").foregroundColor(.white)
                        }
                    }.frame(width: 190, height: 10, alignment: .leading)
                    HStack(){
                        if deviceInfo != nil {
                            Text(deviceInfo!["device-info"]["friendly-device-name"].element!.text).foregroundColor(.white)
                        }
                        else {
                            Text("no name found").foregroundColor(.white)
                        }
                    }.frame(width: 190, height: 10, alignment: .leading)
                    HStack(){
                        if deviceInfo != nil {
                            Text(deviceInfo!["device-info"]["user-device-location"].element!.text).foregroundColor(.white)
                        }
                        else {
                            Text("location not found").foregroundColor(.white)
                        }
                    }.frame(width: 190, height: 10, alignment: .leading)
                }
            }
        }.frame(width: 310, height: 100)
    }
}

//struct DeviceView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeviceView()
//    }
//}
//


struct DevicesView: View, LanScannerDelegate {
    @Binding private var isShowing: Bool
    @Binding private var isComplete: Bool
    @Binding private var isFailed: Bool
    @Binding private var loaded: Bool
    private var apiRoutes: ApiRoutes?
    @State private var deviceXML: String = ""
    
    private var lanScanner: LanScanner?
    let dataModel: CoreDataModel
    
    
    init(isShowing: Binding<Bool>, isComplete: Binding<Bool>, isFailed: Binding<Bool>, loaded: Binding<Bool>){
        print("starting")
        dataModel = CoreDataModel()
        _isShowing = isShowing
        _isComplete = isComplete
        _isFailed = isFailed
        _loaded = loaded
        lanScanner = LanScanner(delegate: self)
    }
    
    
    func lanScannerIPSearchFinished() {
        self.$isComplete.wrappedValue.toggle()
        self.$isShowing.wrappedValue.toggle()
    }
    
    func lanScannerIPSearchCancelled() {
        print("cancelled called")
    }
    
    func lanScannerIPSearchFailed() {
        print("failed called")
        self.$isFailed.wrappedValue.toggle()
    }
    
    
    var body: some View {
        
        if isComplete && loaded{
            VStack{
                HStack{
                    Spacer()
                }
                DeviceView(deviceXML: $deviceXML)
                Spacer()
            }.background(Color.black)
        }
        else{
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    ProgressView("Searching for roku device...").foregroundColor(.white).progressViewStyle(CircularProgressViewStyle(tint: .purple)).onAppear(perform: {
                        if !isShowing {
                            lanScanner!.startNetWorkScan()
                        }
                        else{
                            for device in lanScanner!.connectedDevices {
                                if device.hostname != nil{
                                    if device.hostname.contains("roku"){
                                        Task{
                                            await dataModel.loadAllDatabaseData()
                                            dataModel.assign(device: device.ipAddress!)
                                            let defaults = UserDefaults.standard
                                            defaults.set(device.ipAddress!, forKey: "ipAddress")
                                            let apiRoutes = ApiRoutes()
                                            await apiRoutes.deviceInfo(){
                                                Output in deviceXML = Output
                                                loaded.toggle()
                                            }
                                            defaults.synchronize()
                                        }
                                    }
                                }
                            }
                        }
                    }).isHidden(isShowing)
                    Spacer()
                }
                Spacer()
            }.background(Color.black)
        }
        if isFailed {
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text("Failed to find roku").foregroundColor(.white)
                    Spacer()
                }
                Spacer()
            }.background(Color.black)
        }
    }
}

struct DevicesView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesView(isShowing: .constant(false), isComplete: .constant(false), isFailed: .constant(false), loaded: .constant(false))
    }
}
