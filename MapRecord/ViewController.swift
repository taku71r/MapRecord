//
//  ViewController.swift
//  MapRecord
//
//  Created by 清水拓郎 on 2020/05/23.
//  Copyright © 2020 清水拓郎. All rights reserved.
//

import UIKit
import MapKit
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
            mapView.showsUserLocation = true
        }
        initMap()
       
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        let lonStr = (locations.last?.coordinate.longitude.description)!
        let latStr = (locations.last?.coordinate.latitude.description)!
        print("lon : " + lonStr)
        print("lat : " + latStr)
        
    }
    
    func initMap() {
        var region:MKCoordinateRegion = mapView.region
        region.span.latitudeDelta = 0.1
        region.span.longitudeDelta = 0.1
        mapView.setRegion(region, animated: true)
        
        //現在位置表示の有効化
        mapView.showsUserLocation = true
        //現在位置設定（デバイスの動きとしてこの時の一回だけ中心位置が現在位置で更新される
        mapView.userTrackingMode = .follow
    }


}

