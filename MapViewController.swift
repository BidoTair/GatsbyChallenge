//
//  MapViewController.swift
//  GastbyChallenge
//
//  Created by Abdulghafar Al Tair on 11/23/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {


    var spotList: [Spot] = []
    var locationManager: CLLocationManager?
    var rotation: Bool = false
   
    
    @IBOutlet weak var MapView: MKMapView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spotList = Spot.spotList()
        self.setupMapView()
        
        
        
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.requestAlwaysAuthorization()
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .NotDetermined:
            locationManager!.requestAlwaysAuthorization()
            break
        case .AuthorizedWhenInUse:
            locationManager!.stopUpdatingLocation()
            break
        case .AuthorizedAlways:
            locationManager!.startUpdatingLocation()
            break
        case .Restricted:
            // restricted by e.g. parental controls. User can't enable Location Services
            break
        case .Denied:
            // user denied your app access to Location Services, but can grant access from Settings.app
            break
        default:
            break
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        self.setupMapRegion(latitude, longitude: longitude)
        
        
        
       
        
        if (latitude >= 40.760401 && latitude <= 40.762990) {
            
        }
        else {
            rotation = false
        }
    }
    
    
    func setupMapRegion(latitude: Double, longitude: Double) {
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        MapView.setCenterCoordinate(center, animated: true)
        
//         let span = MKCoordinateSpanMake(0.01, 0.01)
//         let region = MKCoordinateRegion(center: n, span: span)
//          MapView.setRegion(region, animated: true)
        
    }
    
    
    
    func setupMapView() {
        MapView.delegate = self
        
        let nyc = CLLocationCoordinate2D(latitude: 40.7668172, longitude: -73.972312)
        MapView.setCenterCoordinate(nyc, animated: true)
        
        MapView.showsUserLocation = true
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: nyc, span: span)
        MapView.setRegion(region, animated: true)
        
        MapView.mapType = .Standard
        
        for spot in spotList {
           self.MapView.addAnnotation(spot)        }
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!
    {
        let reuseId = "test"
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        
        if (annotation.isKindOfClass(MKUserLocation))   {
            
            if anView == nil {
                    anView = MKAnnotationView()
                    anView!.image = UIImage(named:"Car.png")
                    anView!.canShowCallout = true
            }
            else {
                anView!.annotation = annotation
            }

        }
        
        else {
            return nil
        }

        
        
        
        return anView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
