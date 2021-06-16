//
//  HomeViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 6/14/21.
//  Copyright © 2021 Stant. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var enterButton:    UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var proceedButton:  UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEnterButton()
        configureRegisterButton()
        configureProceedButton()
        checkIfUserLogIn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configureEnterButton() {
        enterButton.layer.cornerRadius = 10
        enterButton.layer.borderWidth  = 1
    }
    
    func configureRegisterButton() {
        registerButton.layer.cornerRadius = 10
        registerButton.layer.borderWidth  = 1
    }
    
    func configureProceedButton() {
        proceedButton.layer.cornerRadius = 10
        proceedButton.layer.borderWidth  = 1
    }
    
    func checkIfUserLogIn() {
        let checkUserLogin = CheckIfUserLogIn(controller: self)
        let segue          = "loginAutomaticSegue"

        checkUserLogin.checkIfUserLogInWithSegue(segue)
    }
}
