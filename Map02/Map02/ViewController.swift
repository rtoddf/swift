import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.didReceiveMemoryWarning()
        
        let latitude:CLLocationDegrees = 33.766596
        let longitude:CLLocationDegrees = -84.356305
        
        let latDelta:CLLocationDegrees = 0.025
        let lonDelta:CLLocationDegrees = 0.025
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta:latDelta, longitudeDelta:lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:latitude, longitude:longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center:location, span:span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Jimmy Carter Presidential Library and Museum"
        annotation.subtitle = "The museum includes photographs"
        annotation.coordinate = location
        map.addAnnotation(annotation)
    }

}

