//
//  EditViewController.swift
//  MapRecord
//
//  Created by 清水拓郎 on 2020/06/06.
//  Copyright © 2020 清水拓郎. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class EditViewController: UIViewController, MKMapViewDelegate, UIGestureRecognizerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    var locManager:CLLocationManager!
    @IBOutlet var longPressGesRec: UILongPressGestureRecognizer!
    var pointAno: MKPointAnnotation = MKPointAnnotation()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initMap()
        
        
    }
    func initMap() {
       var region:MKCoordinateRegion = mapView.region
       region.span.latitudeDelta = 0.1
       region.span.longitudeDelta = 0.1
       mapView.setRegion(region, animated: true)
       
       
       }
    @IBAction func mapViewDidLongPress(_ sender: UILongPressGestureRecognizer) {
        
        //ロングタップ開始
        if sender.state == .began {
        }
        //ロングタップ完了(手を離した)
        else if sender.state == .ended {
            let tapPoint = sender.location(in: view)
            let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            
            
            pointAno.coordinate = center
            mapView.addAnnotation(pointAno)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
