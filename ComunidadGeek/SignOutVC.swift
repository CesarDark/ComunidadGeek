//
//  SingOutVC.swift
//  ComunidadGeek
//
//  Created by CesarDark on 31/10/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import UIKit
import Firebase

class SignOutVC: UIViewController { //Salir
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var publicationsLabel: UIButton!
    @IBOutlet weak var perfilLabel: UIButton!
    @IBOutlet weak var storeLabel: UIButton!
    @IBOutlet weak var contactLabel: UIButton!
    @IBOutlet weak var dudeLabel: UIButton!
    @IBOutlet weak var exitLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        
        publicationsLabel.layer.cornerRadius = 10
        perfilLabel.layer.cornerRadius = 10
        storeLabel.layer.cornerRadius = 10
        contactLabel.layer.cornerRadius = 10
        dudeLabel.layer.cornerRadius = 10
        exitLabel.layer.cornerRadius = 10
        
        guard let username = Auth.auth().currentUser?.displayName else { return }
        label.text = "¡Hola! \(username)"

    }
    
    @IBAction func onSignOutTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch {
            print(error)
        }
        
    }

}
