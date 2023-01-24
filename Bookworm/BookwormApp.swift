//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Denny Arfansyah on 25/01/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            CoreDataView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
