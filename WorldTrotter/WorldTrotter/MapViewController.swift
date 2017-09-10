//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by ouou on 2017/9/10.
//  Copyright © 2017年 ouou. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
        
        view.addSubview(segmentedControl)
        
//        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        
//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topConstraint.setValue(true, forKey: "active")
        leadingConstraint.setValue(true, forKey: "active")
        trailingConstraint.setValue(true, forKey: "active")
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        } 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapView Controller viewDidLoad worked!!!!!!!!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Map view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Map view has appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Map view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Map view has disappeared")
    }
}
