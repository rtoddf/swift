import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let location = CLLocation(latitude: 40.706876, longitude: -74.011265)
        
        // satellite view type
        let mapType = MKMapType.Standard
//        let mapType = MKMapType.Satellite
        
        centerMapOnLocation(location, mapType: mapType)
        
        
        // setting ViewController as the delegate of the map view
        mapView.delegate = self
        
        // set one location
        let locale = Locale(title: "New York Stock Exchange", subtitle: "New York", coordinates: location.coordinate)
        mapView.addAnnotation(locale)
        
        
        // one way is to set the location with coordinate2D
        // set the span - the lower the number, the closer in, below is about several city blocks
        // set the region - center (location) and span
        // then add the region to the view
//        let location = CLLocationCoordinate2D(latitude: 40.706876, longitude: -74.011265)
//        let span = MKCoordinateSpanMake(0.0005, 0.0005)
//        let region = MKCoordinateRegion(center: location, span: span)
//        mapView.setRegion(region, animated: true)
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.title = "Wall Street"
//        annotation.subtitle = "New York"
//        
//        mapView.addAnnotation(annotation)
        
    }
    
    // The region will be have north-south and east-west spans based on a distance of regionRadius
    // – you set this to 1000 meters (1 kilometer), which is a little more than half a mile
    let regionRadius: CLLocationDistance = 1000
    
    // you need to specify the rectangular region to display to get a correct zoom level
    func centerMapOnLocation(location: CLLocation, mapType: MKMapType) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)

        mapView.mapType = mapType
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

