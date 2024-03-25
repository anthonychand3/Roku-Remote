//
//  ContentView.swift
//  Roku Remote
//
//  Created by anthony chand on 3/12/22.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var selection = 0
    @State var isPresented:Bool = false
    @State private var isShowing = false
    @State private var isComplete = false
    @State private var isFailed = false
    @State private var loaded = false
    
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.clear
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill").foregroundColor(Color.purple)
                    Text("Home")
                }
                .tag(0)
            RokuChannelView()
                .tabItem{
                    Text("Roku Channel")
                    Image(systemName: "play.circle").foregroundColor(Color.purple)
                }
                .tag(1)
            RemoteView()
                .tabItem{
                    Text("Remote")
                    Image(systemName: "dpad").foregroundColor(Color.purple)
                }
                .tag(2)
            DevicesView(isShowing: $isShowing, isComplete: $isComplete, isFailed: $isFailed, loaded: $loaded)
                .tabItem{
                    Text("Devices")
                    Image(systemName: "tv").background(Color.white)
                }
                .tag(3)
        }.accentColor(.purple)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
