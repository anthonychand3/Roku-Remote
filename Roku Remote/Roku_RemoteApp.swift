//
//  Roku_RemoteApp.swift
//  Roku Remote
//
//  Created by anthony chand on 3/12/22.
//

import SwiftUI

@main
struct Roku_RemoteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
