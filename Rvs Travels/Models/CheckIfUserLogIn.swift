//
//  CheckIfUserLogIn.swift
//  Rvs Travels
//
//  Created by Renato on 6/15/21.
//  Copyright © 2021 Stant. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class CheckIfUserLogIn {
    
    let controller: UIViewController?

    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func checkIfUserLogInWithSegue(_ withIdentifier: String) {
        Auth.auth().addStateDidChangeListener({(auth, user) in
            if user != nil {
                self.controller?.performSegue(withIdentifier: withIdentifier, sender: nil)
            } else {
                print("Usuario não logado")
            }
        })
    }
}
