//
//  ListaContatosViewController.swift
//  ContatosIP67
//
//  Created by ios7061 on 26/04/17.
//  Copyright © 2017 Caelum. All rights reserved.
//

import UIKit

class ListaContatosViewController: UITableViewController,FormularioContatoViewControllerDelegate {
    
    var dao:ContatoDao!
    static let cellIdentifier:String="Cell"
    var contatoSelecionado: Contato!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dao=ContatoDao.ContatoDaoInstance()
        self.navigationItem.leftBarButtonItem=self.editButtonItem
    }
    
    func exibeFormulario(){
        let storyboard: UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let formulario=storyboard.instantiateViewController(withIdentifier: "Form-Contato") as! FormularioContatoViewController
        formulario.delegate=self
        formulario.contato=contatoSelecionado
        self.navigationController?.pushViewController(formulario, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "FormSegue"{
                if let formulario=segue.destination as?FormularioContatoViewController{
                    formulario.delegate=self
                }
        }
        
    }
    
    func contatoAtualizado(contato: Contato) {
        print ("contato atualizado: \(contato.nome)")
    }
    
    func contatoAdicionado(contato: Contato) {
        print("contato adicionado: \(contato.nome)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dao.contatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contato: Contato=self.dao.buscaContatoNaPosicao(posicao: indexPath.row)
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: ListaContatosViewController.cellIdentifier)
        if cell == nil{
            cell=UITableViewCell(style: .default, reuseIdentifier: ListaContatosViewController.cellIdentifier)
        }
        cell!.textLabel?.text=contato.nome
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dao.removeContatoDaPosicao(posicao: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contatoSelecionado=dao.buscaContatoNaPosicao(posicao: indexPath.row)
        self.exibeFormulario()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
