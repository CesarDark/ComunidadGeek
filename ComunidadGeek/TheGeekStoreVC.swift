//
//  TheGeekStoreVC.swift
//  ComunidadGeek
//
//  Created by CesarDark on 19/11/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import UIKit

class TheGeekStoreVC: UIViewController {
    
    @IBOutlet weak var labelStore: UILabel!
    @IBOutlet weak var labelDispo: UILabel!
    @IBOutlet weak var labelPlayFree: UILabel!
    @IBOutlet weak var labelTicTac: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelStore.layer.masksToBounds = true
        labelDispo.layer.masksToBounds = true
        labelPlayFree.layer.masksToBounds = true
        labelTicTac.layer.masksToBounds = true
        
        labelStore.layer.cornerRadius = 10
        labelDispo.layer.cornerRadius = 10
        labelPlayFree.layer.cornerRadius = 10
        labelTicTac.layer.cornerRadius = 10
    }
    
}
