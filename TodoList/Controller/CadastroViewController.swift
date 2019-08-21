//
//  CadastroController.swift
//  TodoList
//
//  Created by Daniel Pimentel on 02/07/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit
import Toast_Swift

class CadastroViewController: UIViewController {
    

    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    private let userRepository = UserRepository.factory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldName?.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor(red:0.81, green:0.81, blue:0.81, alpha:1.0), thickness: 1)
        
        textFieldEmail?.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor(red:0.81, green:0.81, blue:0.81, alpha:1.0), thickness: 1)
        
        textFieldPassword?.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor(red:0.81, green:0.81, blue:0.81, alpha:1.0), thickness: 1)
    }
    
    @IBAction func clickSignup(_ sender: Any) {
        let textName = textFieldName?.text
        let textEmail = textFieldEmail?.text
        let textPassword = textFieldPassword?.text
        
        if let name = textName, let email = textEmail, let password = textPassword{
            userRepository.cadastro(name: name, email: email, password: password) { (result) in

                if(result) {
                    print("Sucesso")
                    
                    self.view.makeToast("Usuário criado com sucesso. Redirecionando para a tela de Login", duration: 3.0)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.dismiss(animated: true, completion: nil)
                    }
//                    print(result)

                }else{
                    print(result)
                    print("error")
                }

            }
        }
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
