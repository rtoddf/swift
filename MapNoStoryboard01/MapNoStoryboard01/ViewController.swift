import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    let mapView:UIView = {
        let mv = UIView()
        mv.backgroundColor = UIColor(hexString: "#ae0000")
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()
    
    let map:MKMapView = {
        let theMap = MKMapView()
        
//        set specific location
//        let latitude:CLLocationDegrees = 33.766596
//        let longitude:CLLocationDegrees = -84.356305
//
//        let latDelta:CLLocationDegrees = 0.025
//        let lonDelta:CLLocationDegrees = 0.025
//
//        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta:latDelta, longitudeDelta:lonDelta)
//        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:latitude, longitude:longitude)
//
//        let region:MKCoordinateRegion = MKCoordinateRegion(center:location, span:span)
//        theMap.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//        annotation.title = "Jimmy Carter Presidential Library and Museum"
//        annotation.subtitle = "The museum includes photographs"
//        annotation.coordinate = location
//        theMap.addAnnotation(annotation)
        
        theMap.translatesAutoresizingMaskIntoConstraints = false
        return theMap
    }()
    
    func setupViews(){
//        view.addSubview(mapView)
        view.addSubview(map)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": map]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(300)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": map]))
        
        determineCurrentLocation()
    }
    
    func determineCurrentLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()
        
        
        func getLocationName() -> String {
//            var currentLocationName = String()
            
            CLGeocoder().reverseGeocodeLocation(userLocation) {(placemarks, error) in
                if error != nil {
                    return
                }
                
                guard let placemark = placemarks?[0] else { return }

                guard let name = placemark.name else { return }
                var currentLocationName = name
            }
//            print("currentLocationName: \(currentLocationName)")
            
            return "name"
        }
        
        
        let latDelta = 0.025
        let lonDelta = 0.025
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta))
        map.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        myAnnotation.title = getLocationName()
        map.addAnnotation(myAnnotation)
    }
}

http://swiftdeveloperblog.com/mapview-display-users-current-location-and-drop-a-pin/
https://www.raywenderlich.com/160517/mapkit-tutorial-getting-started
https://medium.com/@MissionKao/add-a-mapview-in-ios-app-without-storyboard-swift-7f73cbeada36


//[AnyHashable("Street"): 4460 Ashford Dunwoody Rd NE,
//    AnyHashable("ZIP"): 30346,
//    AnyHashable("Country"): United States,
//    AnyHashable("SubThoroughfare"): 4460,
//    AnyHashable("State"): GA,
//    AnyHashable("Name"): Perimeter Mall,
//    AnyHashable("SubAdministrativeArea"): DeKalb,
//    AnyHashable("Thoroughfare"): Ashford Dunwoody Rd NE, AnyHashable("FormattedAddressLines"): <__NSArrayM 0x604000653410>(
//    Perimeter Mall,
//    4460 Ashford Dunwoody Rd NE,
//    Atlanta, GA  30346,
//    United States
//)

