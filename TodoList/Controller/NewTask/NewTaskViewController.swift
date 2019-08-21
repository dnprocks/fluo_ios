//
//  NewTaskViewController.swift
//  TodoList
//
//  Created by Daniel Pimentel on 20/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet weak var newTaskField: UITextField!
    private let taskRepository = TaskRepository.factory()
    var tasks: Array<TaskResponse> = []
//    private let userRepository = UserRepository.factory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.isOpaque = true
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewTaskClick(_ sender: Any) {
        
        let newTask = newTaskField?.text
        
        if let task = newTask {
            //          guard case let email != "" else { return }
            let taskResponse = TaskResponse(name: task, idProject: "78t16t8n2hq001dckuo93v", idAccountTo: "5th3l0fb8nlkj1denq58ln", description: "Eu devia ter feito humanas", tags: "Ahhh")

            taskRepository.addNewTask(task: taskResponse){ (result) in

                if(result) {

                    print("Aee carai")
                    self.view.makeToast("Tarefa criada com sucesso", duration: 3.0)


                }else{
                    print("error")
                }

            }
        }
    }
}
