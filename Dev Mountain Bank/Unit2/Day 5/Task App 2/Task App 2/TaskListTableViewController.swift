//
//  TaskListTableViewController.swift
//  Task App 2
//
//  Created by Nick Reichard on 2/18/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.sharedController.tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = TaskController.sharedController.tasks[indexPath.row]
        
        
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.sharedController.tasks[indexPath.row]
            TaskController.sharedController.remove(task: task)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTaskTVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let task = TaskController.sharedController.tasks[indexPath.row]
            let detailTVC = segue.destination as? TaskListTableViewController
            detailTVC?.task = task
            detailTVC?.dueDateValue = task.due as? Date
            
        }
    }
    
    // MARK: - Delegate
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let task = TaskController.sharedController.tasks[indexPath.row]
        TaskController.sharedController.toggleIsCompleteFor(task: task)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
