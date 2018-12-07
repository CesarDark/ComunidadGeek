//
//  PerfilViewController.swift
//  ComunidadGeek
//
//  Created by CesarDark on 28/11/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import UIKit
import Firebase

class PerfilViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var labelPerfil: UILabel!
    @IBOutlet weak var labelNameP: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelPerfil.layer.masksToBounds = true
        labelPerfil.layer.cornerRadius = 10
        labelNameP.layer.masksToBounds = true
        labelNameP.layer.cornerRadius = 10
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        
        guard let username = Auth.auth().currentUser?.displayName else { return }
        labelNameP.text = "\(username)"
    }
    
    @IBAction func uploadImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
}
