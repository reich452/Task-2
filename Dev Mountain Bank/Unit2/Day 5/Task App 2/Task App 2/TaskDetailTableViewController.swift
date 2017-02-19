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
    }
    
    var task: Task?
    var dueDateValue: Date?
    
    func updateViews() {
        
        guard let task = self.task else { return }
        
        let stringDate = task.due as Date?
        
        self.nameTextField.text = task.name
        self.notesTextView.text = task.notes
        self.dueDateTextField.text = stringDate?.stringValue()
        
    }
    
    
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    
    
}


