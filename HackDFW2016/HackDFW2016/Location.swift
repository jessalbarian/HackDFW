//
//  Location.swift
//  HackDFW2016
//
//  Created by Jessie Albarian on 4/17/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Location {
    var lat: CLLocationDegrees
    var long: CLLocationDegrees
    
    init(newlat: CLLocationDegrees, newlong: CLLocationDegrees){
        lat = newlat
        long = newlong
    }
}