//
//  HomeViewController.swift
//  TodoList
//
//  Created by Daniel Pimentel on 06/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var containerView: UIView!
    private lazy var todoViewController: TodoViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "TodoViewController") as! TodoViewController
        
        return viewController
    }()
    private lazy var projectsViewController: ProjectsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ProjectsViewController") as! ProjectsViewController
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar?.selectedItem = tabBar.items![0] as UITabBarItem
        updateView()
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        updateView()
    }
    
    @IBAction func openNewTask(_ sender: Any) {
        
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "newTask"){
                viewController.modalPresentationStyle = .overCurrentContext
                self.present(viewController, animated: true, completion: nil)
        }
    }
    
    private func add(asChildViewController viewController: UIViewController){
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func remove(asChildViewController viewController: UIViewController){
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func updateView(){
        if tabBar.selectedItem!.title == "Projects" {
            self.remove(asChildViewController: todoViewController)
            self.add(asChildViewController: projectsViewController)
        }else {
            self.remove(asChildViewController: projectsViewController)
            self.add(asChildViewController: todoViewController)
        }
    }
    
    
}
