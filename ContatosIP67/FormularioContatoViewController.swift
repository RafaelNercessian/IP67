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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pegaDadosDoFormulario(){
        let nome=self.nome.text!
        let telefone=self.telefone.text!
        let endereco=self.endereco.text!
        let site=self.site.text!
        
        print("Nome: \(nome), Telefone: \(telefone), Endereço: \(endereco), Site: \(site)")
    }


}

