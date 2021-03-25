//
//  PacketTravel.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 12/17/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

class PacketTravel: NSObject {
    
    let nameHotel:         String
    let descriptionTravel: String
    let dateTravel:        String
    let travel:            Travel
    
    init(nameHotel: String, descriptionTravel: String, dateTravel: String, travel: Travel) {
        self.nameHotel         = nameHotel
        self.descriptionTravel = descriptionTravel
        self.dateTravel        = dateTravel
        self.travel            = travel
    }
}
