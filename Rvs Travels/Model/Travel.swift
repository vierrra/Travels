//
//  Travel.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 3/31/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import Foundation
import UIKit

class Travel: NSObject {
    
    let title:        String
    let quantityDays: Int
    let price:        Double
    let wayImage:     String
    
    init(title: String, quantityDays: Int, price: Double, wayImage: String) {
        self.title        = title
        self.quantityDays = quantityDays
        self.price        = price
        self.wayImage     = wayImage
    }
}
