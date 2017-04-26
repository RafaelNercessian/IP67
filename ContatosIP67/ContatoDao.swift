//
//  ContatoDao.swift
//  ContatosIP67
//
//  Created by ios7061 on 25/04/17.
//  Copyright © 2017 Caelum. All rights reserved.
//

import UIKit
import Foundation

class ContatoDao: NSObject {
    
    var contatos: Array<Contato>!
    static private var defaultDAO: ContatoDao!
   
    
    override public init(){
        self.contatos=Array()
    }
    
    
    func adicionaContato(contato: Contato){
            contatos.append(contato)
            print(contatos)
    }
    
    static func ContatoDaoInstance() -> ContatoDao{
        if defaultDAO==nil{
            defaultDAO=ContatoDao()
        }
        return defaultDAO
    }
    

}
