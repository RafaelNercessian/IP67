//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios7061 on 25/04/17.
//  Copyright © 2017 Caelum. All rights reserved.
//

import UIKit

class FormularioContatoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var nome: UITextField!
    @IBOutlet var telefone: UITextField!
    @IBOutlet var endereco: UITextField!
    @IBOutlet var site: UITextField!
    @IBOutlet var imageView:UIImageView!
    var dao:ContatoDao!
    var contato: Contato!
    var delegate:FormularioContatoViewControllerDelegate?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.dao = ContatoDao.ContatoDaoInstance()
    }
    
   @IBAction func criaContato(){
        self.pegaDadosDoFormulario()
        dao.adicionaContato(contato: contato)
        if self.delegate != nil{
            self.delegate?.contatoAdicionado(contato: contato)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func atualizaContato(){
        pegaDadosDoFormulario()
        if self.delegate != nil{
            self.delegate?.contatoAtualizado(contato: contato)
        }
        _=self.navigationController?.popViewController(animated: true)
    }
    
    
    func pegaDadosDoFormulario(){
        if contato==nil{
            self.contato=Contato()
        }
        self.contato.nome=self.nome.text!
        self.contato.telefone=self.telefone.text!
        self.contato.endereco=self.endereco.text!
        self.contato.site=self.site.text!
        self.contato.foto = self.imageView.image
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        if contato != nil{
            self.nome.text=contato.nome
            self.telefone.text=contato.telefone
            self.endereco.text=contato.endereco
            self.site.text=contato.site
            if let foto = contato.foto{
                self.imageView.image = self.contato.foto
            }
            let botaoAlterar=UIBarButtonItem(title: "Confirmar", style: .plain, target: self, action: #selector(atualizaContato))
            self.navigationItem.rightBarButtonItem=botaoAlterar
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(selecionaFoto(sender:)))
        self.imageView.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func selecionaFoto(sender: AnyObject){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
        }else{
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageSelecionada = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.imageView.image = imageSelecionada
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    

}

