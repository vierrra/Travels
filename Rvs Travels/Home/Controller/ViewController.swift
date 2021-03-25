//
//  ViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 3/30/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableTravel: UITableView!
    @IBOutlet weak var viewHotels:  UIView!
    @IBOutlet weak var viewPackets: UIView!
    
    let listTravels: [Travel] = TravelDAO().returnAllTravels()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableTravel.dataSource = self
        self.tableTravel.delegate   = self
        
        configureViewHotelsAndPackets()
        
    }
    
    func configureViewHotelsAndPackets() {
        self.viewHotels.layer.cornerRadius  = 10
        self.viewPackets.layer.cornerRadius = 10
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listTravels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell          = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let currentTravel = listTravels[indexPath.row]
        
        cell.configure(travel: currentTravel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
}

