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
    var contato: Contato!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.dao = ContatoDao.ContatoDaoInstance()
    }
    
   @IBAction func criaContato(){
        self.pegaDadosDoFormulario()
        dao.adicionaContato(contato: contato)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func pegaDadosDoFormulario(){
        self.contato = Contato()        
        self.contato.nome=self.nome.text!
        self.contato.telefone=self.telefone.text!
        self.contato.endereco=self.endereco.text!
        self.contato.site=self.site.text!
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

