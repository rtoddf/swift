import UIKit
import MapKit

// http://www.raywenderlich.com/90971/introduction-mapkit-swift-tutorial
// https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/LocationAwarenessPG/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009497-CH1-SW1
// http://www.raywenderlich.com/87008/overlay-views-mapkit-swift-tutorial

// http://www.ioscreator.com/
// http://www.ioscreator.com/tutorials/mapkit-tutorial-swift-ios8

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)

        centerMapOnLocation(initialLocation)
        
        loadInitialData()
        mapView.addAnnotations(artworks)
        
        // setting ViewController as the delegate of the map view
        mapView.delegate = self
        
//        let artwork = Artwork(
//            title: "King David Kalakaua",
//            locationName: "Waikiki Gateway Park",
//            discipline: "Sculpture",
//            coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661)
//        )
        
//        mapView.addAnnotation(artwork)
    }
    
    var artworks = [Artwork]()
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func loadInitialData(){
        // 1
        let fileName = NSBundle.mainBundle().pathForResource("PublicArt", ofType: "json")
        var readError = NSError?()
        var data: NSData = NSData(contentsOfFile: fileName!, options: NSDataReadingOptions(0), error: &readError)!
        
        // 2
        var error: NSError?
        let jsonObject: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error)
        
        // 3
        if let jsonObject = jsonObject as? [String: AnyObject] where error == nil,
        // 4
        let jsonData = JSONValue.fromObject(jsonObject)?["data"]?.array {
            for artworkJSON in jsonData {
                if let artworkJSON = artworkJSON.array,
                    // 5
                    artwork = Artwork.fromJSON(artworkJSON) {
                        artworks.append(artwork)
                }
            }
        }
    }

}