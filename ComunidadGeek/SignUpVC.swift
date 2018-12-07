//
//  SingUpVC.swift
//  ComunidadGeek
//
//  Created by CesarDark on 31/10/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController { //Registrate/Entrar
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    //------------------------------------------
    @IBOutlet weak var labelRegister: UILabel!
    @IBOutlet weak var buttonRegisterGo: UIButton!
    
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        guard let username = usernameTF.text,
        username != "",
        let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Falta Infromación", message: "Por favor rellene todos los campos")
                return
                
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.user.email ?? "Falta correo")
            print(user.user.uid)
            
            let changeRequest = user.user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            })
        })
    }
    
    override func viewDidLoad() {
        labelRegister.layer.masksToBounds = true
        labelRegister.layer.cornerRadius = 10
        
        buttonRegisterGo.layer.cornerRadius = 10
    }
}
