//
//  Spot.swift
//  GastbyChallenge
//
//  Created by Abdulghafar Al Tair on 11/23/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//

import Foundation
import MapKit

class Spot:NSObject, MKAnnotation {
     var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
     var title: String? = ""
    
    
    class func spotList() -> [Spot] {
        let spot1 = Spot()
        spot1.coordinate = CLLocationCoordinate2D(latitude: 40.768055, longitude: -73.9724717)
        spot1.title = "Central Park"
        
        let spot2 = Spot()
        spot2.coordinate = CLLocationCoordinate2D(latitude: 40.761484, longitude: -73.977664)
        spot2.title = "Museum of Modern Art"
        
        let spot3 = Spot()
        spot3.coordinate = CLLocationCoordinate2D(latitude: 40.7518625, longitude: -73.9889275)
        spot3.title = "Culture Espresso"
        
        let spot4 = Spot()
        spot4.coordinate = CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708)
        spot4.title = "Times Square"
        
        return [spot1, spot2, spot3, spot4]
        
        
    }
    
}
