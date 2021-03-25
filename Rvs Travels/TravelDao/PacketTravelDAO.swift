//
//  PacketTravelDAO.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 17/07/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

class PacketTravelDAO: NSObject {
    
    func returnAllTravels() -> Array<PacketTravel> {
        
        let packetPortoGalinhas = PacketTravel(nameHotel:         "Resort Porto de Galinhas",
                                               descriptionTravel: "Hotel + café da manhã",
                                               dateTravel:        "8~15 de agosto",
                                               travel:            Travel(title:        "Porto de Galinhas",
                                                                         quantityDays: 7,
                                                                         price:        2490.99,
                                                                         wayImage:     "img6.jpg"))
        
        let packetBuzios = PacketTravel(nameHotel:         "Resort Buzios Spa",
                                        descriptionTravel: "Hotel + café da manhã",
                                        dateTravel:        "9~16 de setembro",
                                        travel:            Travel(title:        "Buzios",
                                                                  quantityDays: 7,
                                                                  price:        1990.99,
                                                                  wayImage:     "img7.jpg"))
        
        let packetNatal = PacketTravel(nameHotel:         "Resort Natal Show",
                                       descriptionTravel: "Hotel + café da manhã",
                                       dateTravel:        "13~18 de setembroo",
                                       travel:            Travel(title:        "Natal",
                                                                 quantityDays: 5,
                                                                 price:        1700.99,
                                                                 wayImage:     "img8.jpg"))
        
        let packetRioDeJaneiro = PacketTravel(nameHotel:         "Resort RJ Spa",
                                              descriptionTravel: "Hotel + café da manhã",
                                              dateTravel:        "9~13 de outubro",
                                              travel:            Travel(title:        "Rio de Janeiro",
                                                                        quantityDays: 4,
                                                                        price:        2300.99,
                                                                        wayImage:     "img9.jpg"))
        
        let packetAmazonas = PacketTravel(nameHotel:         "Pousada Amazonas Plus",
                                          descriptionTravel: "Hotel + café da manhã",
                                          dateTravel:        "9~13 de outubro",
                                          travel:            Travel(title:        "Amazonas",
                                                                    quantityDays: 6,
                                                                    price:        2850.99,
                                                                    wayImage:     "img10.jpg"))
        
        let packetSalvador = PacketTravel(nameHotel:         "Pousada Salvador",
                                          descriptionTravel: "Hotel + café da manhã",
                                          dateTravel:        "5~10 de novembro",
                                          travel:            Travel(title:        "Salvador",
                                                                    quantityDays: 6,
                                                                    price:        1880.99,
                                                                    wayImage:     "img11.jpg"))
        
        let listPackets: Array <PacketTravel> = [packetPortoGalinhas, packetBuzios, packetNatal, packetRioDeJaneiro, packetAmazonas, packetSalvador]
        
        return listPackets
    }
}








