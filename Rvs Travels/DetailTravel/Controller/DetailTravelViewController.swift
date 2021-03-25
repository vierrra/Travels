//
//  DetailTravelViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 12/17/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

class DetailTravelViewController: UIViewController {

    @IBOutlet weak var imagePacketTravel:      UIImageView!
    @IBOutlet weak var titlePacketTravelLabel: UILabel!
    @IBOutlet weak var descriptionPacketLabel: UILabel!
    @IBOutlet weak var dateTravelLabel:        UILabel!
    @IBOutlet weak var pricePacketTravelLabel: UILabel!
    @IBOutlet weak var quantityDaysLabel:      UILabel!
    @IBOutlet weak var finishPayButton:        UIButton!
    
    var selectionPacket: PacketTravel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showScreenDetail()
        
    }
    
    func showScreenDetail() {
        if let selectionPacket = selectionPacket {
            self.imagePacketTravel.image            = UIImage(named: selectionPacket.travel.wayImage)
            self.titlePacketTravelLabel.text        = selectionPacket.travel.title
            self.descriptionPacketLabel.text        = selectionPacket.descriptionTravel
            self.dateTravelLabel.text               = selectionPacket.dateTravel
            self.pricePacketTravelLabel.text        = String(selectionPacket.travel.price)
            self.quantityDaysLabel.text             = selectionPacket.travel.quantityDays == 1 ? "1 dia" : "\(selectionPacket.travel.quantityDays) dias"
            self.finishPayButton.layer.cornerRadius = 8
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    @available(iOS 10.3, *)
    @IBAction func finishPayButton(_ sender: UIButton) {
        let storyboard     = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "confirmPay") as! ConfirmPayViewController
        
        viewController.packetPay = selectionPacket
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
