//
//  ConfirmPayViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 12/17/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

class ConfirmPayViewController: UIViewController {
    @IBOutlet weak var packetTravelImage:            UIImageView!
    @IBOutlet weak var locationTravelLabel:          UILabel!
    @IBOutlet weak var nameHotelLabel:               UILabel!
    @IBOutlet weak var dateTravelLabel:              UILabel!
    @IBOutlet weak var quantityPersonLabel:          UILabel!
    @IBOutlet weak var descriptionPacketTravelLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var packetPay: PacketTravel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showScreenConfirmPayment()
    }
    
    func showScreenConfirmPayment() {
        
        if let packetPay = packetPay {
            self.packetTravelImage.image               = UIImage(named: packetPay.travel.wayImage)
            self.locationTravelLabel.text              = packetPay.travel.title.uppercased()
            self.nameHotelLabel.text                   = packetPay.nameHotel
            self.dateTravelLabel.text                  = packetPay.dateTravel
            self.descriptionPacketTravelLabel.text     = packetPay.descriptionTravel
            self.packetTravelImage.layer.cornerRadius  = 10
            self.packetTravelImage.layer.masksToBounds = true
            self.backButton.layer.cornerRadius         = 8
        }
    }
    
    @IBAction func backActionButton(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
