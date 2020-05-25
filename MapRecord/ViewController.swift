//
//  ViewController.swift
//  MapRecord
//
//  Created by 清水拓郎 on 2020/05/23.
//  Copyright © 2020 清水拓郎. All rights reserved.
//

import UIKit

//MapKit frameworkをインポートする
import MapKit
//現在地取得用
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var mapView: MKMapView!
    var locManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locManager = CLLocationManager()
        locManager.delegate = self
        
        //位置情報の使用の許可を得る
        locManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                //座標の表示
                locManager.startUpdatingLocation()
                break
            default:
                break
           
            }
        }
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
            let lonStr = (locations.last?.coordinate.longitude.description)!
            let latStr = (locations.last?.coordinate.latitude.description)!
            
            print("lon :" + lonStr)
            print("lat :" + latStr)
        }
        
        
    }


}

