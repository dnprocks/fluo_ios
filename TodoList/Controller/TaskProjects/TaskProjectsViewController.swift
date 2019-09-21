//
//  TaskProjectsViewController.swift
//  TodoList
//
//  Created by Daniel Pimentel on 17/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class TaskProjectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellReuseIdentifier = "task_project_cell"
    private let taskRepository = TaskRepository.factory()
    var tasks: Array<TaskResponse>? = []
    @IBOutlet weak var tableView: UITableView!
    public var projectSelected: String? = nil
    
    @IBAction func fechar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskRepository.getTasksByProject(projectSelected!){(result, success) in
            if success {
                self.tasks = result
                self.tableView.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Total de sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks!.count
    }
    
    // Altura de Header....Espaçamento entre item...
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 14
    }
    
    // Layout do Hearder
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TaskProjectTableViewCell
        
        let task = tasks![indexPath.section]
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.lblTitle.text = task.description
        
        return cell
    }


}
