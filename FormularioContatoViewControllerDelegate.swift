//
//  FormularioContatoViewControllerDelegate.swift
//  ContatosIP67
//
//  Created by ios7061 on 27/04/17.
//  Copyright © 2017 Caelum. All rights reserved.
//

import Foundation

protocol FormularioContatoViewControllerDelegate{
    func contatoAtualizado(contato:Contato)
    func contatoAdicionado(contato:Contato)
}
