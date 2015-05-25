import Foundation
import MapKit

class location: NSObject {
    let title: String
    let subtitle: String
    let coordinates: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinates: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinates = coordinates
        
        super.init()
    }
    
}