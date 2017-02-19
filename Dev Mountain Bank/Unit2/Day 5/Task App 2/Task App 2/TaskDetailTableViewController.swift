//
//  TaskDetailTableViewController.swift
//  Task App 2
//
//  Created by Nick Reichard on 2/18/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
        dueDateTextField.inputView = dueDatePicker  //se the date picker as teh dueTextFiels input view
    }
    
    var task: Task?
    var dueDateValue: Date?
    
    private func updateViews() {
        
        guard let task = self.task else { return }
        
        let stringDate = task.due as Date?
        
        self.nameTextField.text = task.name
        self.notesTextView.text = task.notes
        self.dueDateTextField.text = stringDate?.stringValue()
        
    }
    
    // MARK: - Private
    
    private func updateTask() {
        
        guard let name = nameTextField.text else { return }
        let due = dueDateValue
        let notes = notesTextView.text
        
        if let task = self.task {
            TaskController.sharedController.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.sharedController.add(taskWithName: name, notes: notes, due: due)
        }
        
        
    }
    
    
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        updateTask()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        updateTask()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dueDateTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.nameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    
}


