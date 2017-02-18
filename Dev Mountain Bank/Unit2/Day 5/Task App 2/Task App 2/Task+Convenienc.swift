//
//  Task+Convenienc.swift
//  Task App 2
//
//  Created by Nick Reichard on 2/18/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String? = nil, due: Date? = nil, context: NSManagedObjectContext = Stack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.due = due as NSDate?
        self.isComplete = false
        
    }
    
    
}
