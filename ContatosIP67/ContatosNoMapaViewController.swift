//
//  ContatosNoMapaViewController.swift
//  ContatosIP67
//
//  Created by ios7061 on 03/05/17.
//  Copyright © 2017 Caelum. All rights reserved.
//

import UIKit
import MapKit
class ContatosNoMapaViewController: UIViewController,MKMapViewDelegate {
    
     @IBOutlet weak var mapa: MKMapView!
     let locationManager=CLLocationManager()
     var contatos: [Contato] = Array()
     let dao:ContatoDao = ContatoDao.ContatoDaoInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapa.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        let botaoLocalizacao=MKUserTrackingBarButtonItem(mapView: self.mapa)
        self.navigationItem.rightBarButtonItem=botaoLocalizacao
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.contatos=dao.lista()
        self.mapa.addAnnotations(self.contatos)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.mapa.removeAnnotations(self.contatos)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
            let identifier:String = "pino"
            var pino:MKPinAnnotationView
            if let reusablePin = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView{
                pino=reusablePin
            }else{
                pino=MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            }
            if let contato = annotation as? Contato{
                pino.pinTintColor = UIColor.red
                pino.canShowCallout = true
                
                if let foto = contato.foto {
                    let frame = CGRect( x: 0.0, y: 0.0, width: 32.0, height: 32.0)
                    let imagemContato = UIImageView(frame: frame )
                    
                    imagemContato.image = foto
                    pino.leftCalloutAccessoryView = imagemContato
                }
            }
            
        return pino
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
