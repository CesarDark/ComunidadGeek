//
//  ContactViewController.swift
//  ComunidadGeek
//
//  Created by CesarDark on 19/11/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mensaggeLabel: UILabel!
    @IBOutlet weak var contactButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userLabel.layer.masksToBounds = true
        userLabel.layer.cornerRadius = 10
        telLabel.layer.masksToBounds = true
        telLabel.layer.cornerRadius = 10
        emailLabel.layer.masksToBounds = true
        emailLabel.layer.cornerRadius = 10
        mensaggeLabel.layer.masksToBounds = true
        mensaggeLabel.layer.cornerRadius = 10
        
        contactButton.layer.cornerRadius = 10
    }

}
