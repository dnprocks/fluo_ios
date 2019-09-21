//
//  NewTaskViewController.swift
//  TodoList
//
//  Created by Daniel Pimentel on 20/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
   
    
    private let taskRepository = TaskRepository.factory()
    private let projectRepository = ProjectRepository.factory()
    private let userRepository = UserRepository.factory()
    private var projectSelected: Int? = nil
    
    @IBOutlet weak var newTaskField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tasks: Array<TaskResponse> = []
    var projects: Array<ProjectResponse> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isOpaque = true
        getProjects()
    }

    private func getProjects() {
        projectRepository.getProjects(token: userRepository.getToken()!) { result in
            if result.count > 0 {
                self.projects = result
                self.collectionView.reloadData()
            }
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewTaskClick(_ sender: Any) {
        
        if let indexProject = projectSelected {
            
            let project = projects[indexProject]
            let task = newTaskField?.text
            
            let taskResponse = TaskResponse(name: task!, idProject: "78t16t8n2hq001dckuo93v", idAccountTo: "5th3l0fb8nlkj1denq58ln", description: "", tags: "")
            
            // TODO Salvar task
            taskRepository.addNewTask(task: taskResponse){ (result) in

                    if(result) {

                        self.view.makeToast("Tarefa criada com sucesso", duration: 3.0)

                    }else{
                        
                        print("error")
                        
                    }

             }
            
        }else{
            // TODO: Exibir mensagem para selecionar o projeto
        }
        
//        let newTask = newTaskField?.text
//
//        if let task = newTask {
//            //          guard case let email != "" else { return }
//            let taskResponse = TaskResponse(name: task, idProject: "78t16t8n2hq001dckuo93v", idAccountTo: "5th3l0fb8nlkj1denq58ln", description: "Eu devia ter feito humanas", tags: "Ahhh")
//
//            taskRepository.addNewTask(task: taskResponse){ (result) in
//
//                if(result) {
//
//                    self.view.makeToast("Tarefa criada com sucesso", duration: 3.0)
//
//                }else{
//                    print("error")
//                }
//
//            }
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_project", for: indexPath) as! NewProjectsCollectionViewCell
        let project = projects[indexPath.row]
        cell.bind(project: project)
        
        if(indexPath.row == projectSelected){
            cell.backgroundColor = .blue
        }else{
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//        var cell = collectionView.cellForItem(at: indexPath) as! ProjectsCollectionViewCell
//        cell.backgroundColor = .blue
//        collectionView.reloadItems(at: [indexPath])
        projectSelected = indexPath.row
        collectionView.reloadData()
    }
}
