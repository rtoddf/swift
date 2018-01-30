import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // distanceFilter is done in meters
        locationManager.distanceFilter = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        let userLocation:CLLocation = locations[0]
        
        CLGeocoder().reverseGeocodeLocation(userLocation) {(placemarks, error) in
            
            if error != nil {
                return
            }
            
            guard let placemark = placemarks?[0] else { return }
            
            print(placemark)
            
        }
        
//        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
//        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
//
//        let latDelta:CLLocationDegrees = 0.025
//        let lonDelta:CLLocationDegrees = 0.025
//
//        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta:latDelta, longitudeDelta:lonDelta)
//        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:latitude, longitude:longitude)
//
//        let region:MKCoordinateRegion = MKCoordinateRegion(center:location, span:span)
//        map.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//        annotation.title = "This is the current location"
//        annotation.subtitle = "See me!!"
//        annotation.coordinate = location
//        map.addAnnotation(annotation)
    }
    
}

