//
//  RecordViewController.swift
//  MapRecord
//
//  Created by 清水拓郎 on 2020/06/04.
//  Copyright © 2020 清水拓郎. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RecordViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    var locManager: CLLocationManager!
    
    var timer: Timer!
    var latArray = [0]
    var longArray = [0]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initMap()
        self.start()
    }
    func start() {
    //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.recordPoint), userInfo: nil, repeats: true)
    timer.fire()
    }
    
    @objc func recordPoint(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
