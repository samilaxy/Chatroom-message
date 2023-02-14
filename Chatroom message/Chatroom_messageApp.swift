//
//  Chatroom_messageApp.swift
//  Chatroom message
//
//  Created by Noye Samuel on 14/02/2023.
//

import SwiftUI

@main
struct Chatroom_messageApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
