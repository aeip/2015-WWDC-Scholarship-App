//
//  MapViewController.swift
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/23/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var bgImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame
        bgImage.addSubview(blurView)
        
        mapView.mapType = MKMapType.Satellite
        
        let dchsLoc = CLLocationCoordinate2D(latitude: 39.3889677, longitude: -104.8556329)
        let caLoc = CLLocationCoordinate2D(latitude: 39.302748, longitude: -104.872076)
        let dchsPoint = MKPointAnnotation()
        let caPoint = MKPointAnnotation()
        dchsPoint.coordinate = dchsLoc
        caPoint.coordinate = caLoc
        
        mapView.addAnnotation(dchsPoint)
        mapView.addAnnotation(caPoint)
        
        let midPoint = CLLocationCoordinate2D(latitude: 39.345858, longitude: -104.86386)
        
        let region = MKCoordinateRegionMakeWithDistance(midPoint, 8500, 8500)
        mapView.setRegion(region, animated: true)
    }
}
