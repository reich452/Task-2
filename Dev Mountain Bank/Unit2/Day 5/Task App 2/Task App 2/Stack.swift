//
//  Stack.swift
//  Task App 2
//
//  Created by Nick Reichard on 2/18/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import CoreData

class Stack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Task App 2")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}

