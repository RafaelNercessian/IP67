//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios7061 on 25/04/17.
//  Copyright © 2017 Caelum. All rights reserved.
//

import UIKit

class FormularioContatoViewController: UIViewController {
    
    @IBOutlet var nome: UITextField!
    @IBOutlet var telefone: UITextField!
    @IBOutlet var endereco: UITextField!
    @IBOutlet var site: UITextField!
    var dao:ContatoDao!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.dao = ContatoDao()
    }
    
    
    @IBAction func pegaDadosDoFormulario(){
        let contato: Contato = Contato()
        
        
        contato.nome=self.nome.text!
        contato.telefone=self.telefone.text!
        contato.endereco=self.endereco.text!
        contato.site=self.site.text!
        
        dao.adicionaContato(contato: contato)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

}

