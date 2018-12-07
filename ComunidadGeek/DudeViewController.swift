//
//  DudeViewController.swift
//  ComunidadGeek
//
//  Created by CesarDark on 19/11/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import UIKit

class DudeViewController: UIViewController {

    
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var returnsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        payLabel.layer.masksToBounds = true
        payLabel.layer.cornerRadius = 10
        returnsLabel.layer.masksToBounds = true
        returnsLabel.layer.cornerRadius = 10
    }
    
}
