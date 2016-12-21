//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Cecilia  Villatoro on 1/23/16.
//  Copyright © 2016 Cecilia  Villatoro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate{
    var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var button : UIButton!
    
    override func loadView(){
        mapView = MKMapView()
      
        
        
        
        view = mapView
//        button = UIButton()
//        button.setTitle("Show current location", forState: UIControlState.Normal)
//        button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
//        mapView.addSubview(button)
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        
        
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        //top constraint: top
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        //leading constraint: margin left
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        //trailing constraint: margin right
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        segmentedControl.addTarget(self,
            action: "mapTypeChanged:",
            forControlEvents: .ValueChanged)
        
        
    }
    
    

    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if (CLLocationManager.authorizationStatus() == .NotDetermined){
            
            locationManager.requestWhenInUseAuthorization()
        }
        
     
        mapView.showsUserLocation = true
 
        print("MapViewController loaded its view")
    }
}