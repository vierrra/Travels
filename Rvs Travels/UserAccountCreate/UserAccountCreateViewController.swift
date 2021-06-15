//
//  createAccountUserViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 6/14/21.
//  Copyright © 2021 Stant. All rights reserved.
//

import UIKit
import Firebase

class createAccountUserViewController: UIViewController {

    @IBOutlet weak var emailTextField:           UITextField!
    @IBOutlet weak var passwordTextField:        UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var accountCreateButton:      UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        configureButton()
        setSecurityAndEntryOfFields()
    }
    
    @IBAction func createAccountButtonAction(_ sender: Any) {
        createAccountUser()
    }
    
    private func createAccountUser() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else { return }
        
        if password == confirmPassword {
            let createUser = Auth.auth()
            
            createUser.createUser(withEmail: email, password: password, completion: {(user, error) in
                
                if error == nil {
                    self.performSegue(withIdentifier: "accountCreateSegue", sender: nil)
                } else {
                    let errorRecovery = error?.localizedDescription
                    var errorMessage  = ""
                    
                    switch errorRecovery {
                        case "The email address is badly formatted.":
                            errorMessage = "Email inválido, insira um email válido."
                        
                        case "The password must be 6 characters long or more.":
                            errorMessage = "A senha tem que ter no mínimo 6 caracteres."
                        
                        case "The email address is already in use by another account.":
                            errorMessage = "Este email está sendo usado por outro usuário."
                        
                        default:
                            Alert(controller: self).showAlert(title: "Aviso", message: "Entrada dos dados estão incorretas")
                    }
                    Alert(controller: self).showAlert(title: "Aviso", message: errorMessage)
                }
                
            })
        } else {
            Alert(controller: self).showAlert(title: "Aviso", message: "Senhas são diferentes")
        }
    }
    
    private func configureButton() {
        accountCreateButton.layer.cornerRadius = 10
        accountCreateButton.layer.borderWidth  = 1
    }
    
    private func setSecurityAndEntryOfFields() {
        emailTextField.keyboardType                = .emailAddress
        passwordTextField.isSecureTextEntry        = true
        confirmPasswordTextField.isSecureTextEntry = true
    }
}
