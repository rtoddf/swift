import UIKit
import MapKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        setupMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let mapView:MKMapView = {
        let map = MKMapView()
        map.mapType = .satelliteFlyover
        /*
         .hybrid
         .satellite
         .satelliteFlyover
         
        */
        /* why can't I put this outside?? */
        let westminster = CLLocationCoordinate2DMake(51.499292, -0.12731)
        let camera = MKMapCamera(lookingAtCenter: westminster, fromDistance: 100, pitch: 100, heading: 262)
        map.camera = camera
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = westminster
        map.addAnnotation(annotation)
        
        return map
    }()

    func setupMap() {
        view.addSubview(mapView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: mapView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: mapView)
    }

}

