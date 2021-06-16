//
//  PacketsTravelsViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 7/25/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import Firebase

class PacketsTravelsViewController: UIViewController {
    
    @IBOutlet weak var collectionViewPacketsTravels: UICollectionView!
    @IBOutlet weak var searchTravels:                UISearchBar!
    @IBOutlet weak var countPacketsLabel:            UILabel!
    
    let allTravels: [PacketTravel] = PacketTravelDAO().returnAllTravels()
    
    var travelsList: [PacketTravel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewPacketsTravels.dataSource = self
        collectionViewPacketsTravels.delegate   = self
        searchTravels.delegate                  = self
        
        travelsList = allTravels
        self.countPacketsLabel.text = self.updateCountPackets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    func updateCountPackets() -> String {
        return travelsList.count == 1 ? "1 pacote encontrado" : "\(travelsList.count) pacotes encontrados"
    }
}

extension PacketsTravelsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTravels.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellPackets = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPackets", for: indexPath) as! PacketsTravelsCollectionViewCell
        
        let currentPackets = allTravels[indexPath.item]

        cellPackets.titleTravelLabel.text  = currentPackets.travel.title
        cellPackets.quantityDaysLabel.text = "\(currentPackets.travel.quantityDays) dias"
        cellPackets.priceLabel.text        = "R$\(currentPackets.travel.price)"
        cellPackets.imageTravel.image      = UIImage(named: currentPackets.travel.wayImage)
        
        cellPackets.layer.borderWidth = 0.5
        cellPackets.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        cellPackets.layer.cornerRadius = 5
        
        return cellPackets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let sizeCellCollection = (collectionViewPacketsTravels.bounds.width - 15) / 2

        return CGSize(width: sizeCellCollection, height: 160)
    }
    
    @available(iOS 10.3, *)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailTravelViewController
        let packet = travelsList[indexPath.item]
        
        Auth.auth().addStateDidChangeListener({(auth, user) in
            if user != nil {
                viewController.selectionPacket = packet
                self.navigationController?.pushViewController(viewController, animated: true)
            } else {
                self.navigationController?.popToRootViewController(animated: true)
            }
        })
    }
}

extension PacketsTravelsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // toDo
    }
}

