//
//  Alert.swift
//  Rvs Travels
//
//  Created by Renato on 6/14/21.
//  Copyright © 2021 Stant. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert(title: String, message: String) {
        let alert    = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okButton)
        
        controller?.present(alert, animated: true, completion: nil)
    }
}
