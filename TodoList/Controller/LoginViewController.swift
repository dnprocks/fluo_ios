//
//  LoginViewController.swift
//  TodoList
//
//  Created by Felipe Arimateia on 02/07/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    private let userRepository = UserRepository.factory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldEmail?.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor(red:0.81, green:0.81, blue:0.81, alpha:1.0), thickness: 1)

        textFieldPassword?.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor(red:0.81, green:0.81, blue:0.81, alpha:1.0), thickness: 1)

    }
    
    @IBAction func clickLogin(_ sender: Any){
        
        let textEmail = textFieldEmail?.text
        let textPassword = textFieldPassword?.text
        
        // Token
        //5chutmbpaa9051di6omddr
        // danielnpimentel@gmail.com
        // 7jdp776a
        
//         textEmail = "dirceu@fourtime.com"
//        let textPassword = "senha123"
        
//        textEmail =
//        textPassword =
        
//        if let tabBarViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home") {
//            self.present(tabBarViewController, animated: true, completion: nil)
//        }
        
        if let email = textEmail, let password = textPassword{
//          guard case let email != "" else { return }
            userRepository.login(email: email, password: password) { (result) in

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
    
    
    
}

