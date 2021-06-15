//
//  TableViewCell.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 3/31/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle:        UILabel!
    @IBOutlet weak var labelQuandityDays: UILabel!
    @IBOutlet weak var labelPrice:        UILabel!
    @IBOutlet weak var imageTravel:       UIImageView!
    
    public func configure(travel: Travel) {
        labelTitle.text                 = travel.title
        labelQuandityDays.text          = travel.quantityDays == 1 ? "1 dia" : "\(travel.quantityDays) dias"
        labelPrice.text                 = "R$\(travel.price)"
        imageTravel.image               = UIImage(named: travel.wayImage)
        imageTravel.layer.cornerRadius  = 10
        imageTravel.layer.masksToBounds = true
    }
}
