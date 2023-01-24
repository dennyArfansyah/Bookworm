//
//  DataController.swift
//  Bookworm
//
//  Created by Denny Arfansyah on 25/01/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data cannot be load: \(error.localizedDescription)")
            }
        }
    }
    
    
}
