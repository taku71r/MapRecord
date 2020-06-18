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

class EditViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var testlabel: UILabel!
    
    var coordinateArrayE : [CLLocationCoordinate2D] = []
    var colorNumberArrayE : [Int] = []
    //var arrayNumberE = coordinateArrayE.count
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
        initMap()
        
        print("数字: \(colorNumberArrayE)")
        print(coordinateArrayE.count)
        print(colorNumberArrayE.count)
        writeLine()
        
        
    }
    
    func initMap() {
       var region:MKCoordinateRegion = mapView.region
       region.span.latitudeDelta = 0.1
       region.span.longitudeDelta = 0.1
       mapView.setRegion(region, animated: true)
       
       
       }
    func writeLine() {
        
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
