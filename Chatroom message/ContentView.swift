//
//  ContentView.swift
//  Chatroom message
//
//  Created by Noye Samuel on 14/02/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
   
    var body: some View {
        CoreData()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
