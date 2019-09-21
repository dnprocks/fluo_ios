//
//  ProjectsViewController.swift
//  TodoList
//
//  Created by Daniel Pimentel on 17/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let projectRepository = ProjectRepository.factory()
    private let userRepository = UserRepository.factory()
    
    var projects: Array<ProjectResponse> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProjects()
        // Do any additional setup after loading the view.
    }
    
    private func getProjects() {
        projectRepository.getProjects(token: userRepository.getToken()!) { result in
            if result.count > 0 {
                self.projects = result
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_projects", for: indexPath) as! ProjectsCollectionViewCell
        let project = projects[indexPath.row]
        cell.bind(project: project)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        //        var cell = collectionView.cellForItem(at: indexPath) as! ProjectsCollectionViewCell
        //        cell.backgroundColor = .blue
        //        collectionView.reloadItems(at: [indexPath])
//        projectSelected = indexPath.row
        let page: TaskProjectsViewController? =  self.storyboard?.instantiateViewController(withIdentifier: "TaskProjects") as! TaskProjectsViewController
        if let viewController = page {
            viewController.modalPresentationStyle = .overFullScreen
            viewController.projectSelected = projects[indexPath.row].id
            self.present(viewController, animated: true, completion: nil)
        }
        
        collectionView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
