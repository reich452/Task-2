//
//  TaskController.swift
//  Task App 2
//
//  Created by Nick Reichard on 2/18/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var tasks: [Task] = []
    
    // MARK: - Mock test ?? in code snipit 
    
   
    
    
    // MARK: - Create
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    // MARK: - Read
    
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? Stack.context.fetch(request)) ?? []
    }
    
    // MARK: - Update
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due as NSDate?
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    // MARK: - Delete
    
    func remove(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    // MARK: - Persistents
    func saveToPersistentStore() {
        do {
            try Stack.context.save()
        } catch {
            print("Error saving managed object context. Items not saved")
        }
    }
    
    
    
}
