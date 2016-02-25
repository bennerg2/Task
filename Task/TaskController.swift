//
//  TaskController.swift
//  Task
//
//  Created by Benjamin Thomas Gurrola on 2/7/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskController: NSObject {
    private let TaskKey = "tasks"
    static let sharedController = TaskController()
    var tasksArray: [Task] = []
    var completedTasks: [Task] {
        return tasksArray.filter({!$0.isComplete})
    }
    var incompleteTasks: [Task] {
        return tasksArray.filter({$0.isComplete})
    }
    func addTask(task: Task) {
        tasksArray.append(task)
        saveToPersistentStorage()
    }
    func removeTask(task: Task) {
        let index = tasksArray.indexOf(task)
        tasksArray.removeAtIndex(index!)
    }
    
    // MARK: Mock Data
    var mockTasks:[Task] {
        let task1 = Task(name: "First Task", notes: "some notes")
        let task2 = Task(name: "Number dos", notes: "Bacon ipsum dolor amet spare ribs turducken tri-tip rump, bacon frankfurter short loin boudin shankle filet mignon kielbasa sirloin jowl brisket pork. Cupim salami leberkas, turducken tenderloin venison short ribs doner.\n\nT-bone pancetta bacon ribeye kielbasa prosciutto. Venison prosciutto frankfurter filet mignon, ribeye bacon strip steak. Bacon spare ribs turducken, doner ground round corned beef strip steak picanha turkey shankle drumstick porchetta. Short ribs picanha prosciutto, shankle ball tip pig andouille sirloin short loin tri-tip drumstick", dueDate: NSDate(timeIntervalSinceNow: 3600 * 24 * 6))
        let task3 = Task(name: "Dishes", notes: "A happy wife makes for a happy life")
        task3.isComplete = true;
        
        return [task1, task2, task3]
    }
    
    override init() {
        super.init()
        // tasksArray = mockTasks
        loadFromPersistentStorage()
    }
    
    // MARK: Persistence
    
    func loadFromPersistentStorage() {
        let unarchivedTasks = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(TaskKey))
        if let tasksArray = unarchivedTasks as? [Task] {
            self.tasksArray = tasksArray
        }
    }
    
    func saveToPersistentStorage() {
        NSKeyedArchiver.archiveRootObject(self.tasksArray, toFile: self.filePath(TaskKey))
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        return entriesPath
    }
}































