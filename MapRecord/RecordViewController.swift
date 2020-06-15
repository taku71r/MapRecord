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

class RecordViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    var locManager: CLLocationManager!
    var lonArray: [Double] = [0]
    var latArray: [Double] = [0]
    var colorNumber = 1
    @IBOutlet var label : UILabel!
    //var lon: Double = 0
    //var lat: Double = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locManager = CLLocationManager()
        locManager.delegate = self
        mapView.delegate = self
        
        initMap()
        
        //self.start()
        locManager.startUpdatingLocation()
        
       
    }
    
    
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        //決められた間隔ごとに現在地を取得
            let lon = (locations.last?.coordinate.longitude)!
            let lat = (locations.last?.coordinate.latitude)!
            
            //それぞれ配列に追加していく
            lonArray.append(lon)
            latArray.append(lat)
            //配列の現在の個数をarrayNumberで表す（-1した数にする）
            let arrayNumber = lonArray.count - 1
            
            //確認用
            print(lon)
            print(lat)
            print(lonArray)
            print(arrayNumber)
            
            //現在の座標データをcoordinate1に、一個前の座標データをcoordinate2にする
            if arrayNumber > 1 {
                let coordinate1 = CLLocationCoordinate2D(latitude: latArray[arrayNumber], longitude: lonArray[arrayNumber])
                let coordinate2 = CLLocationCoordinate2D(latitude: latArray[arrayNumber - 1], longitude: lonArray[arrayNumber - 1])
                //polylineを引くcoordinatesを設定する。
                let coordinates = [coordinate1, coordinate2]
                let PolyLine: MKPolyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
                DispatchQueue.main.async {
                    self.mapView.addOverlay(PolyLine)
                }
                
                //ここに書く必要はない
                mapView.showsUserLocation = true
                
                mapView.userTrackingMode = .follow
                
            }
        }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let polylineRenderer = MKPolylineRenderer(polyline: polyline)
            if colorNumber == 0 {
                polylineRenderer.strokeColor = .blue
            } else if colorNumber == 1 {
                polylineRenderer.strokeColor = .red
            } else if colorNumber == 2 {
                polylineRenderer.strokeColor = .green
            } else if colorNumber == 3 {
                polylineRenderer.strokeColor = .gray
            }
            
            polylineRenderer.lineWidth = 10.0
            return polylineRenderer
        }
        return MKOverlayRenderer()
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
    
    @IBAction func blueButtonTapped() {
        colorNumber = 0
        label.text = "選択中の色：青"
    }
    @IBAction func redButtonTapped() {
        colorNumber = 1
        label.text = "選択中の色：赤"
    }
    @IBAction func greenButtonTapped() {
        colorNumber = 2
        label.text = "選択中の色：緑"
    }
    @IBAction func grayButtonTapped() {
        colorNumber = 3
        label.text = "選択中の色：グレー"
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
