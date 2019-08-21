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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar?.selectedItem = tabBar.items![0] as UITabBarItem
    }
    
    
    @IBAction func openNewTask(_ sender: Any) {
        
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "newTask"){
                viewController.modalPresentationStyle = .overCurrentContext
                self.present(viewController, animated: true, completion: nil)
        }
    }
    
}
