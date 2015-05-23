import UIKit
import MapKit

// http://www.raywenderlich.com/90971/introduction-mapkit-swift-tutorial
// https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/LocationAwarenessPG/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009497-CH1-SW1
// http://www.raywenderlich.com/87008/overlay-views-mapkit-swift-tutorial

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)

        centerMapOnLocation(initialLocation)
        
        // setting ViewController as the delegate of the map view
        mapView.delegate = self
        
        let artwork = Artwork(
            title: "King David Kalakaua",
            locationName: "Waikiki Gateway Park",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661)
        )
        
        mapView.addAnnotation(artwork)
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }

}

