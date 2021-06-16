//
//  ViewController.swift
//  Rvs Travels
//
//  Created by Renato Vieira on 3/30/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import MessageUI
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , MFMailComposeViewControllerDelegate {
   
    @IBOutlet weak var tableTravel:   UITableView!
    @IBOutlet weak var viewHotels:    UIView!
    @IBOutlet weak var viewPackets:   UIView!
    @IBOutlet weak var logOffButton:  UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    let listTravels: [Travel] = TravelDAO().returnAllTravels()
    
    var user : User?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableTravel.dataSource = self
        self.tableTravel.delegate   = self
        
        configureViewHotelsAndPackets()
        configureLogOffButton()
        recoveryUserDatabase()
    }
    
    func configureViewHotelsAndPackets() {
        self.viewHotels.layer.cornerRadius  = 10
        self.viewPackets.layer.cornerRadius = 10
    }
    
    func configureLogOffButton() {
        Auth.auth().addStateDidChangeListener({(auth, user) in
            if user == nil {
                self.logOffButton.isEnabled = false
            } else {
                self.logOffButton.isEnabled = true
            }
        })
    }
    
    @IBAction func logOfftAction(_ sender: Any) {
        alertLogOfUser()
    }
    
    
    @IBAction func contactUs(_ sender: Any) {
        let mailViewControler = MFMailComposeViewController()
        
        mailViewControler.mailComposeDelegate = self
        mailViewControler.setToRecipients(["vierrra@hotmail.com"])
        
        self.present(mailViewControler, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func loggOfUser() {
        let logOff = Auth.auth()
        do{
            try logOff.signOut()
            if let navigationController = self.navigationController {
                navigationController.popToRootViewController(animated: true)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func alertLogOfUser() {
        let alert    = UIAlertController(title: "Aviso", message: "Você quer mesmo sair do sistemas?", preferredStyle: .alert)
        let okCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: "Confirmar", style: .default, handler: { (_) in
            
            self.loggOfUser()
        })
        
        alert.addAction(okButton)
        alert.addAction(okCancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func recoveryUserDatabase() {
        let dataBase = Database.database().reference()
        let users    = dataBase.child("users")

        users.observe(DataEventType.childAdded, with: {(snapshot) in
        
            let data = snapshot.value as! NSDictionary
            let emailUser   = data["email"] as! String
            let nameUser    = data["name"] as! String
            let idUser      = snapshot.key
            let userCurrent = User(email: emailUser, name: nameUser, uid: idUser)
            
            self.configureUserNameLabel(name: userCurrent.name)
        })
    }
    
    func configureUserNameLabel(name: String) {
        userNameLabel.text = "Olá, \(name)"
        userNameLabel.backgroundColor = .clear
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

