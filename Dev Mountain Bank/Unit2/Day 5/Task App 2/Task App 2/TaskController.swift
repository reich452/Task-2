//
//  TaskController.swift
//  Task App 2
//
//  Created by Nick Reichard on 2/18/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

class TaskController {
    
    static let sharedController = TaskController()
    
    var tasks: [Task] = []
    
    // MARK: - Mock test ?? in code snipit 
    
   
    
    
    // MARK: - Create
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    // MARK: - Read
    
    func fetchTasks() -> [Task] {
        return []
    }
    
    // MARK: - Update
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    // MARK: - Delete
    
    func remove(task: Task) {
        
    }
    
    // MARK: - Persistents
    func saveToPersistentStore() {
        
    }
    
    
    
}
