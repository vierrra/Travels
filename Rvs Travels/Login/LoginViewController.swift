//
//  LoginViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 6/14/21.
//  Copyright © 2021 Stant. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField:    UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton:       UIButton!
    
//    let email    = "vierrra@hotmail.com"
//    let password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        configureButton()
        setSecurityAndEntryOfFields()
    }
    
    @IBAction func enterButtonAction(_ sender: Any) {
        self.login()
    }
    
    private func login() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        let login = Auth.auth()
        
        login.signIn(withEmail: email, password: password, completion: {(user, error) in
            if error == nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                let errorRecovery = error?.localizedDescription
                var errorMessage  = ""
                
                switch errorRecovery {
                    case "The email address is badly formatted.":
                        errorMessage = "Email inválido, insira um email válido."
                        
                    case "There is no user record corresponding to this identifier. The user may have been deleted.":
                        errorMessage = "Não há registro de usuário correspondente a este email. O email pode ter sido excluído."
                    
                    case "The password is invalid or the user does not have a password.":
                        errorMessage = "A senha é inválida ou o usuário não possui uma senha."
                        
                    default:
                        Alert(controller: self).showAlert(title: "Aviso", message: "Entrada de dados incorreta")
                }
                
                Alert(controller: self).showAlert(title: "Aviso", message: errorMessage)
            }
        })
    }
    
    private func configureButton() {
        enterButton.layer.cornerRadius = 10
        enterButton.layer.borderWidth  = 1
    }
    
    private func setSecurityAndEntryOfFields() {
        emailTextField.keyboardType                = .emailAddress
        passwordTextField.isSecureTextEntry        = true
    }
}
