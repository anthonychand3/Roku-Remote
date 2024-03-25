//
//  RemoteView.swift
//  Roku Remote
//
//  Created by anthony chand on 3/12/22.
//

import SwiftUI
import SWXMLHash

struct RemoteView: View {
    
    @State private var apiRoutes: ApiRoutes?
    @State private var showAlert = false
    @State private var on = false
    
    var body: some View {
        VStack{
            HStack{Spacer()}
            HStack{
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .trailing).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.back)
                    }
                    Image(systemName: "arrow.backward").foregroundColor(Color.white)
                }
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .center).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.returnToHome)
                    }
                    Image(systemName: "house").foregroundColor(Color.white)
                }
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .leading).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        // my device is a roku express it does not support power on and off
                        // implmeneted logic to power on and off would need to expended it based on model-name
//                        Task{
//                            if self.apiRoutes?.deviceIpAddress != nil {
//                                await self.apiRoutes?.deviceInfo(){
//                                    Output in
//                                    let deviceInfo = XMLHash.parse(Output)
//                                    if deviceInfo["device-info"]["power-mode"].element!.text == "PowerOn" {
//                                        self.apiRoutes?.powerOff()
//                                    }
//                                    else{
//                                        self.apiRoutes?.powerOn()
//                                    }
//                                }
//                            }
//                        }
                        if on == false {
                            apiTest(operation: self.apiRoutes!.powerOn)
                            on.toggle()
                        }
                        else{
                            apiTest(operation: self.apiRoutes!.powerOff)
                            on.toggle()
                        }
                    }
                    Image(systemName: "power").foregroundColor(Color.white)
                }
            }
            
            Spacer()
            
            HStack{
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .center).cornerRadius(10).rotationEffect(Angle(degrees:270)).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.arrowUp)
//                        self.apiRoutes?.arrowUp()
                    }
                    Image(systemName: "chevron.up").foregroundColor(Color.white)
                }
            }
            HStack{
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .trailing).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.arrowLeft)
                    }
                    Image(systemName: "chevron.left").foregroundColor(Color.white)
                }
                
                ZStack{
                    Circle().frame(width: 75, height: 75, alignment: .center).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.ok)
                    }
                    Text("OK").foregroundColor(Color.white)
                }
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .leading).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.arrowRight)
                    }
                    Image(systemName: "chevron.right").foregroundColor(Color.white)
                }
            }.padding()
            
            HStack{
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .center).cornerRadius(10).rotationEffect(Angle(degrees:270)).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.arrowDown)
                    }
                    Image(systemName: "chevron.down").foregroundColor(Color.white)
                }
            }
            
            Spacer()
            
            HStack{
                Spacer()
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .trailing).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.instantReplay)
                    }
                    Image(systemName: "gobackward").foregroundColor(Color.white).rotationEffect(Angle(degrees: 200))
                }
                Rectangle().frame(width: 75, height: 50, alignment: .trailing).cornerRadius(10).opacity(0.0)
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .leading).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.additionalOptions)
                    }
                    Image(systemName: "staroflife.fill").foregroundColor(Color.white)
                }
                Spacer()
            }
            HStack{
                
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .trailing).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.rewind)
                    }
                    Image(systemName: "backward.fill").foregroundColor(Color.white)
                }
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .center).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.play)
                    }
                    Image(systemName: "playpause.fill").foregroundColor(Color.white)
                }
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .leading).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.fastForward)
                    }
                    Image(systemName: "forward.fill").foregroundColor(Color.white)
                }
                
            }
            HStack{
                
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .trailing).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.volumeDown)
                    }
                    Image(systemName: "speaker.wave.1.fill").foregroundColor(Color.white)
                }
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .center).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.muteVolume)
                    }
                    Image(systemName: "speaker.slash.fill").foregroundColor(Color.white)
                }
                ZStack{
                    Rectangle().frame(width: 75, height: 50, alignment: .leading).cornerRadius(10).foregroundColor(Color.purple).onTapGesture {
                        apiTest(operation: self.apiRoutes!.volumeUp)
                    }
                    Image(systemName: "speaker.wave.3.fill").foregroundColor(Color.white)
                }
                
            }
        }.background(Color.black).onAppear(){
            print("loading remote view....")
            apiRoutes = ApiRoutes()
            if apiRoutes?.deviceIpAddress == nil{
                showAlert.toggle()
            }
        }.alert("Please Connect To Roku", isPresented: $showAlert) {
            Button("Ok") {
            }
        }
    }
    
    func apiTest(operation: () -> Void) {
        if (apiRoutes?.deviceIpAddress) != nil {
            operation()
        }
    }
}

struct RemoteView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteView()
    }
}
