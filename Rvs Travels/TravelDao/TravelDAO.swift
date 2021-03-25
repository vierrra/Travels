//
//  PacketTravelDAO.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 17/07/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

class TravelDAO {
    
    func returnAllTravels() -> [Travel] {
        let ceara               = Travel(title: "Ceará",
                                         quantityDays: 3,
                                         price: 1799.99,
                                         wayImage: "img1.png")
        let rioDeJaneiro        = Travel(title: "Rio de Janeiro",
                                         quantityDays: 6,
                                         price: 1199.99,
                                         wayImage: "img2.jpg")
        let interiorSaoPaulo    = Travel(title: "Atibaia - Sao Paulo",
                                         quantityDays: 1,
                                         price: 889.99,
                                         wayImage: "img3.jpg")
        let paraiba             = Travel(title: "Paraíba",
                                         quantityDays: 3,
                                         price: 1384.99,
                                         wayImage: "img4.jpg")
        let fortaleza           = Travel(title: "Fortaleza",
                                         quantityDays: 4,
                                         price: 3120.99,
                                         wayImage: "img5.jpg")
        let listTravel:[Travel] = [rioDeJaneiro, ceara, interiorSaoPaulo, paraiba, fortaleza]
        
        return listTravel
    }
}
