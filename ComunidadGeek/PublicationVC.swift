//
//  PublicationVC.swift
//  ComunidadGeek
//
//  Created by CesarDark on 03/11/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import FirebaseDatabase

class PublicationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var refPublication: DatabaseReference!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldContent: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var createPublic: UIButton!
    @IBOutlet weak var publicationLabel: UILabel!
    
    //Tabla de Publicaciones
    @IBOutlet weak var tablePublications: UITableView!
    
    var publicationsList = [PublicationModel]()
    
    //Actualizar valores
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let publication = publicationsList[indexPath.row]
        
        let alertController = UIAlertController(title: publication.name, message: "Escribe los nuevos valores", preferredStyle:.alert)
        
        //Actualizar
        let updateAction = UIAlertAction(title: "Actualizar", style:.default){(_) in
            let id = publication.id
            let name = alertController.textFields?[0].text
            let content = alertController.textFields?[1].text
            
            self.updatePublication(id: id!, name: name!, content: content!)
        }
        
        //Eliminar
        let deleteAction = UIAlertAction(title: "Eliminar", style:.default){(_) in
            self.deletePublication(id: publication.id!)
        }
        
        alertController.addTextField{(textField) in
            textField.text = publication.name
        }
        
        alertController.addTextField{(textField) in
            textField.text = publication.content
        }
        
        alertController.addAction(updateAction)
        alertController.addAction(deleteAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    //Función Actualizar
    func updatePublication(id: String, name: String, content: String){
        let publication = [
            "id": id,
            "publicationName": name,
            "publicationContent": content]
        
        refPublication.child(id).setValue(publication)
        labelMessage.text = "Publicación Actualizada"
    }
    
    //Función Elminar
    func deletePublication(id: String){
        refPublication.child(id).setValue(nil)
    }
    
    //---------------------------------------------------------------------------
    //Table View
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publicationsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        let publication: PublicationModel
        
        publication = publicationsList[indexPath.row]
        cell.lblName.text = publication.name
        cell.lblContent.text = publication.content
        
        return cell
    }
    
    //Boton añadir
    @IBAction func buttonAddPublication(_ sender: UIButton) {
        addPublication()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPublic.layer.cornerRadius = 10
        publicationLabel.layer.masksToBounds = true
        publicationLabel.layer.cornerRadius = 10
        
        refPublication = Database.database().reference().child("publications")
        refPublication.observe(DataEventType.value, with: { (DataSnapshot) in
            if DataSnapshot.childrenCount > 0 {
                self.publicationsList.removeAll()
                
                for publications in DataSnapshot.children.allObjects as! [DataSnapshot] {
                    let publicationObject = publications.value as? [String: AnyObject]
                    
                    let publicationName = publicationObject? ["publicationName"]
                    let publicationContent = publicationObject? ["publicationContent"]
                    let publicationId = publicationObject? ["id"]
                    
                    let publication = PublicationModel(id: publicationId as! String?, name: publicationName as! String?, content: publicationContent as! String?)
                    
                    self.publicationsList.append(publication)
                }
                self.tablePublications.reloadData()
            }
        })
    }
    
    //Función Añadir Publicación
    func addPublication() {
        let key = refPublication.childByAutoId().key
        let publication = ["id": key,
                           "publicationName": textFieldName.text! as String,
                           "publicationContent": textFieldContent.text! as String]
        
        refPublication.child(key!).setValue(publication)
        labelMessage.text = "Publicación Creada"
    }

}
