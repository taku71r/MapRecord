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
