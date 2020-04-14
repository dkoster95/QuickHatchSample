//
//  MapTableViewCell.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 4/7/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell, MKMapViewDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    @IBOutlet weak var mapView: MKMapView!
    
    func configure(latitude: Double, longitude: Double, name: String) {
        let location = MKPointAnnotation()
        location.title = name
        location.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.addAnnotation(location)
        mapView.setCenter(location.coordinate, animated: true)
    }

}
