//
//  PublicationModel.swift
//  ComunidadGeek
//
//  Created by CesarDark on 03/11/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

class PublicationModel {
    
    var id: String?
    var name: String?
    var content: String?
    
    init(id: String?, name: String?, content: String?) {
        
        self.id = id
        self.name = name
        self.content = content
    }
}
