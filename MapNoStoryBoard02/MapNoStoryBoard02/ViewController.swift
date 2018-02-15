// https://www.raywenderlich.com/160517/mapkit-tutorial-getting-started

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let map:MKMapView = {
        let mv = MKMapView()
        
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        
        mv.setRegion(coordinateRegion, animated: true)
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMap()
    }
    
    func setupMap() {
        view.addSubview(map)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": map]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": map]))
    }
}

