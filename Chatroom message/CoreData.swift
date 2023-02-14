//
//  CoreData.swift
//  Chatroom message
//
//  Created by Noye Samuel on 14/02/2023.
//

import SwiftUI
import CoreData

struct CoreData: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    let joinMessage = Message(userId: "1",
                              contents: nil,
                              date: Date(),
                              hasJoined: true, // Set the joined Boolean
                              hasLeft: false,
                              isBeingDrafted: false,
                              isSendingBalloons: false)
    let textMessage = Message(userId: "2",
                              contents: "Hey everyone!", // Pass a message
                              date: Date(),
                              hasJoined: false,
                              hasLeft: false,
                              isBeingDrafted: false,
                              isSendingBalloons: false)
    let brokenMessage = Message(userId: "1",
                                contents: "Hi there", // Have text to show a joining state
                                date: Date(),
                                hasJoined: true, // But this message also signals
                                hasLeft: true, // ... and a leaving state
                                isBeingDrafted: false,
                                isSendingBalloons: false)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
private func addItem() {
    withAnimation {
        let newItem = Item(context: viewContext)
        newItem.timestamp = Date()
        
        do {
            try viewContext.save()
        } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private func deleteItems(offsets: IndexSet) {
    withAnimation {
        offsets.map { items[$0] }.forEach(viewContext.delete)
        
        do {
            try viewContext.save()
        } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
}
struct CoreData_Previews: PreviewProvider {
    static var previews: some View {
        CoreData()
    }
}
