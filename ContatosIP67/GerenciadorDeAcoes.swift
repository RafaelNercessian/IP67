//
//  GerenciadorDeAcoes.swift
//  ContatosIP67
//
//  Created by ios7061 on 02/05/17.
//  Copyright © 2017 Caelum. All rights reserved.
//

import UIKit

class GerenciadorDeAcoes: NSObject {
    
    let contato:Contato
    var controller:UIViewController!
    
        init(do contato:Contato){
            self.contato=contato
        }
    
   func exibirAcoes(em controller:UIViewController){
        self.controller=controller
        let alertView = UIAlertController(title: self.contato.nome, message: nil, preferredStyle: .actionSheet)
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let exibirContatoNoMapa=UIAlertAction(title: "Visualizar No Mapa", style: .default) {
            action in self.abrirMapa()
        }
        let exibirSiteDoContato=UIAlertAction(title: "Visualizar Site", style: .default){
            action in self.abrirNavegador()
        }
        let ligarParaContato = UIAlertAction(title: "Ligar", style: .default){
            action in self.ligar()
        }
    
        alertView.addAction(cancelar)
        alertView.addAction(ligarParaContato)
        alertView.addAction(exibirContatoNoMapa)
        alertView.addAction(exibirSiteDoContato)
    
        self.controller.present(alertView, animated: true, completion: nil)
    }
    
    
    private func ligar(){
        
    }
    
    private func abrirSite() {
        
    }
    
    private func mostrarMapa() {
        
    }
    
    private func abrirMapa(){
        
    }
    
    private func abrirNavegador(){
        
    }
    

}
