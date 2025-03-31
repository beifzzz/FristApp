//
//  ViewController.swift
//  mapView
//
//  Created by Arystan on 25.11.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocation()
    
    var followMe = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.requestWhenInUseAuthorization()
        
        
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        
        let mapDragRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.didDragMap))
        
        mapDragRecognizer.delegate = self
        
        mapView.addGestureRecognizer(mapDragRecognizer)
        
        //Metki na karte
        
        let lat:CLLocationDegrees = 37.957666
        let long:CLLocationDegrees = -122.0323133
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Title"
        annotation.subtitle = "subtitle"
        
        mapView.addAnnotation(annotation)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressAction))
        longPress.minimumPressDuration = 2
        mapView.addGestureRecognizer(longPress)
        
        mapView.delegate = self
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0]
        
        print(userLocation)
        
        if followMe {
    
            let latDelta:CLLocationDegrees = 0.01
            let longDelta:CLLocationDegrees = 0.01
            
            let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            
            let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
            
            mapView.setRegion(region, animated: true)
        }
    }
    @IBAction func showMyLocation(_ sender: Any) {
        followMe = true
    }
    
    @objc func didDragMap(gestureRecognizer: UIGestureRecognizer) {
        if (gestureRecognizer.state == UIGestureRecognizer.State.changed) {
            
            followMe = false
            
            print("Map drag changed")
        }
    }
    
    @objc func longPressAction(gestureRecognizer: UIGestureRecognizer) {
        print("gestureRecognizer")
        
        let touchPoint = gestureRecognizer.location(in: mapView)
        
        let newCoor: CLLocationCoordinate2D = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoor
        
        annotation.title = "Title"
        annotation.subtitle = "subtitle"
        
        mapView.addAnnotation(annotation)
    }
    
}

