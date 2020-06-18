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

class EditViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var testlabel: UILabel!
    
    //座標
    var coordinateArrayE : [CLLocationCoordinate2D] = []
    //線の色
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
        mapView.userTrackingMode = .follow
        
        
    }
    
    func initMap() {
        var region:MKCoordinateRegion = mapView.region
        region.span.latitudeDelta = 0.1
        region.span.longitudeDelta = 0.1
        mapView.setRegion(region, animated: true)
        
        
    }
    func writeLine() {
        //線の数
        let arrayNumberE = colorNumberArrayE.count
        //線の数だけ繰り返し処理で線を引いていく
        for i in 1...arrayNumberE{
            let coordinate1 = coordinateArrayE[i]
            let coordinate2 = coordinateArrayE[i-1]
            //polylineを引くcoordinatesを設定する。
            let coordinates = [coordinate1, coordinate2]
            let PolyLine: MKPolyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
            DispatchQueue.main.async {
                self.mapView.addOverlay(PolyLine)
            }
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let polylineRenderer = MKPolylineRenderer(polyline: polyline)
            polylineRenderer.strokeColor = .blue
            polylineRenderer.lineWidth = 2.0
            return polylineRenderer
        }
        return MKOverlayRenderer()
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
