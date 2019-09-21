//
//  ViewController.swift
//  TodoList
//
//  Created by Felipe Arimateia on 21/05/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let userRepository = UserRepository.factory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if userRepository.getToken() != nil {
//
////            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "tabBar"){
////                self.present(viewController, animated: true, completion: nil)
////            }
//
//            if let tabBarViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home") {
//                self.present(tabBarViewController, animated: true, completion: nil)
//            }
//
//        }
        
    
        userRepository.login(email: "danielnpimentel@gmail.com", password: "dnprocks"){
            (result) in

            if(result) {
                //                    self.dismiss(animated: true, completion: nil)
                if let tabBarViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home") {
                    self.present(tabBarViewController, animated: true, completion: nil)
                }

            }else{
                print("error")
            }

        }
    }
}

