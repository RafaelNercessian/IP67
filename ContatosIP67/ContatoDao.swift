//
//  ContatoDao.swift
//  ContatosIP67
//
//  Created by ios7061 on 25/04/17.
//  Copyright © 2017 Caelum. All rights reserved.
//

import UIKit
import Foundation

class ContatoDao: CoreDataUtil {
    
    var contatos: Array<Contato>!
    static private var defaultDAO: ContatoDao!
    
    
    override private init(){
        self.contatos=Array()
        super.init()
        self.inserirDadosIniciais()
        print("BD,\(NSHomeDirectory())")
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
    
    func buscaContatoNaPosicao(posicao:Int)->Contato{
        return contatos[posicao]
    }
    
    func removeContatoDaPosicao(posicao:Int){
        contatos.remove(at: posicao)
    }
    
    func buscaPosicaoDoContato(_contato:Contato) -> Int{
        return contatos.index(of: _contato)!
    }
    
    func lista()->[Contato]{
        return contatos
    }
    
    func inserirDadosIniciais(){
        let configuracoes=UserDefaults.standard
        let dadosInseridos=configuracoes.bool(forKey: "dados_inseridos")
        if !dadosInseridos{
            let caelumSP=NSEntityDescription.insertNewObject(forEntityName: "Contato", into: self.persistentContainer.viewContext) as! Contato
            
            caelumSP.nome="Caelum SP"
            caelumSP.endereco="São Paulo, SP, Rua Vergueiro, 3185"
            caelumSP.telefone="11-9999-8888"
            caelumSP.site="http://www.caelum.com.br"
            caelumSP.latitude = -23.5883034
            caelumSP.longitude = -46.632369
            self.saveContext()
            configuracoes.set(true, forKey: "dados_inseridos")
            configuracoes.synchronize()
        }
    }
    

}
