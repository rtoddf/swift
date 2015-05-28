import UIKit
import MapKit

// http://www.ioscreator.com/tutorials/searching-map-view-ios8-swift

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var segmentedContol: UISegmentedControl!
    
    let initialLocation = CLLocation(latitude: 40.759011, longitude: -73.984472)
    let span = 2000.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let region = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, span * 2.0, span * 2.0)
        
        mapView.setRegion(region, animated: true)
        
        searchInMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func searchOnValueChanged(sender: AnyObject) {
    }
    
    func searchInMap() {
        let request = MKLocalSearchRequest()
        
        request.naturalLanguageQuery = segmentedContol.titleForSegmentAtIndex(segmentedContol.selectedSegmentIndex)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center: initialLocation.coordinate, span: span)
        
        // 3
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler {
            (response: MKLocalSearchResponse!, error: NSError!) in
            
            for item in response.mapItems as! [MKMapItem] {
                println("Item name = \(item.name)")
                println("Latitude = \(item.placemark.location.coordinate.latitude)")
                println("Longitude = \(item.placemark.location.coordinate.longitude)")
            }
        }
    }

}

