//
//  User.swift
//  Rvs Travels
//
//  Created by Renato on 6/16/21.
//  Copyright © 2021 Stant. All rights reserved.
//

import Foundation
import UIKit

class User {
    let email: String
    let name: String
    let uid : String
    
    init(email: String, name: String, uid: String) {
        self.email = email
        self.name  = name
        self.uid   = uid
    }
}
