//
//  HomeViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 6/14/21.
//  Copyright © 2021 Stant. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var enterButton:    UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var proceedButton:  UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        configureEnterButton()
        configureRegisterButton()
        configureProceedButton()
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
}
