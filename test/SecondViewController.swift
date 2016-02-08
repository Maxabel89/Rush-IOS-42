//
//  SecondViewController.swift
//  test
//
//  Created by swift on 20/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController, CLLocationManagerDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    let  locationManager = CLLocationManager()
    @IBOutlet weak var bouton: UIButton!
    var i = false;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2D(
            latitude: 48.8965812,
            longitude: 2.3183760
        )
        
        let span = MKCoordinateSpanMake(0.003, 0.003)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Ecole 42"
        annotation.subtitle = "Born to Code"
        mapView.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = MKMapType.Satellite;
        case 1:
            mapView.mapType = MKMapType.Hybrid;
        case 2:
            mapView.mapType = MKMapType.Standard;
        default:
            mapView.mapType = MKMapType.Satellite;
        }
    }

    
    @IBAction func myButtonPressed(sender : UIButton){
        if (i == false)
        {
            bouton.setImage(UIImage(named:"rsz_fleche1.png"),forState:UIControlState.Normal)
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            i = true
        }
        else
        {
            bouton.setImage(UIImage(named:"Location.png"),forState:UIControlState.Normal)
            self.locationManager.stopUpdatingLocation()
            i = false
        }
    }
 
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last as CLLocation!
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        mapView.setRegion(region, animated: true)
        }

}