//
//  Task.swift
//  Task
//
//  Created by Benjamin Thomas Gurrola on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import Foundation

class Task: NSObject, NSCoding {
    
    // MARK: Keys
    private let NameKey = "nameKey"
    private let NoteKey = "noteKey"
    private let DueKey = "dueKey"
    private let CompleteKey = "completeKey"
    
    var name: String
    var notes: String?
    var dueDate: NSDate?
    var isComplete: Bool
    
    // memberwise initializer
    init(name: String, notes: String?, dueDate: NSDate = NSDate()) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = false
        
        // Don't think I quite understand this... look into it
        super.init()
    }
    
    // MARK: NSCoding
    required init?(coder aDecoder: NSCoder) {
        guard let _ = aDecoder.decodeObjectForKey(NameKey) as? String else {
            self.name = ""
            self.notes = ""
            self.dueDate = NSDate()
            self.isComplete = false
            
            super.init()
            
            return nil
        }
        
        self.name = (aDecoder.decodeObjectForKey(NameKey) as? String)!
        self.notes = (aDecoder.decodeObjectForKey(NoteKey) as? String?)!
        self.dueDate = (aDecoder.decodeObjectForKey(DueKey) as? NSDate?)!
        self.isComplete = (aDecoder.decodeObjectForKey(CompleteKey) as? Bool)!
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: NameKey)
        aCoder.encodeObject(self.notes, forKey: NoteKey)
        aCoder.encodeObject(self.dueDate, forKey: DueKey)
        aCoder.encodeObject(self.isComplete, forKey: CompleteKey)
    }

}

func ==(lhs: Task, rhs: Task) -> Bool {
    return (lhs.name == rhs.name) && (lhs.notes == rhs.notes) && (lhs.isComplete == rhs.isComplete)
}
