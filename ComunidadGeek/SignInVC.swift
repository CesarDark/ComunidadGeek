//
//  ViewController.swift
//  ComunidadGeek
//
//  Created by CesarDark on 31/10/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController { //Registrarse
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    //----------------------------------------
    @IBOutlet weak var labelGeek: UILabel!
    @IBOutlet weak var buttonSesion: UIButton!
    @IBOutlet weak var buttonRegister: UIButton!
    
    
    
    @IBAction func onSignInTapped(_ sender: Any) {
        
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Falta Información", message: "Por favor rellena todos los campos")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.user.email ?? "Falta correo")
            print(user.user.displayName ?? "Falta nombre")
            print(user.user.uid)
            
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelGeek.layer.masksToBounds = true
        labelGeek.layer.cornerRadius = 10
        
        buttonSesion.layer.cornerRadius = 10
        buttonRegister.layer.cornerRadius = 10
    }
}

