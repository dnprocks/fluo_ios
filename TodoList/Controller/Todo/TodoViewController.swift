//
//  TodoViewController.swift
//  TodoList
//
//  Created by Daniel Pimentel on 13/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdentifier = "todo_cell"
    private let taskRepository = TaskRepository.factory()
    var tasks: Array<TaskResponse> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskRepository.getTasksByProject("4d8kbl18bisli1dcn1to4e"){ (tasks, success) in
            
            if let items = tasks {
                self.tasks = items
                self.tableView?.reloadData()
            }
            
        }
    }
    
    // MARK: UITableViewDataSource
    
    
    // Total de de itens na section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Total de sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TodoTableViewCell
        
        let task = tasks[indexPath.section]
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.lblTitle.text = task.description
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
}
