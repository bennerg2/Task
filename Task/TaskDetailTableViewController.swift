//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Benjamin Thomas Gurrola on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import Foundation

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?
    var dueDateValue: NSDate?
    
    // MARK: Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDueTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    // MARK: Actions
    
    @IBAction func userTappedView(sender: UITapGestureRecognizer) {
        self.taskNameTextField.resignFirstResponder()
        self.taskDueTextField.resignFirstResponder()
        self.taskNotesTextView.resignFirstResponder()
    }
    
    @IBAction func cancelButtonWasTapped(sender: UIBarButtonItem) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonWasTapped(sender: UIBarButtonItem) {
        updateTask()
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        self.taskDueTextField.text = sender.date.toString()
        dueDateValue = sender.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateTask() {
        
        // setting values
        let name = taskNameTextField.text!
        var due: NSDate?
        if let _ = dueDateValue { due = dueDateValue } else { due = NSDate() }
        let notes = taskNotesTextView.text
        
        if ((name == "") && (notes == nil)) { return }
        
        // if there is a task, update it
        if let task = self.task {
            task.name = name
            task.dueDate = due
            task.notes = notes
        } else { // if not, create a new task with the values
            let newTask = Task(name: name, notes: notes, dueDate: due!)
            TaskController.sharedController.addTask(newTask)
        }
        if let _ = navigationController {
          navigationController?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func updateWithTask(task: Task) {
        self.task = task
        title = task.name
        taskNameTextField.text = task.name
        
        if let due = task.dueDate {
            taskDueTextField.text = due.toString()
        }
        
        if let notes = task.notes {
            taskNotesTextView.text = notes
        }
    }
}














