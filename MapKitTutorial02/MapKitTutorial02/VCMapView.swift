import Foundation
import MapKit

/*
    Provide the map with the information it needs to display the annotation.
    The map view will call its viewForAnnotation delegate method.
    Your job in this delegate method is to return an instance of MKPinAnnotationView
    to present as a visual indicator of the annotation.

    Your ViewController will be the delegate for the map view.
    To avoid clutter and improve readability, you’ll create an extension 
    of ViewController in a separate file.
*/

extension ViewController: MKMapViewDelegate {
    // 1
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? Artwork {
            let identifier = "pin"
            var view: MKPinAnnotationView
            
            if let dequedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView {
                // 2
                dequedView.annotation = annotation
                view = dequedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
//                view.pinColor = annotation.pinColor()
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            return view
        }
        return nil
    }
}

/*
    1:
    mapView(_:viewForAnnotation:) is the method that gets called for every annotation you add to the map
    (kind of like tableView(_:cellForRowAtIndexPath:) when working with table views),
    to return the view for each annotation.
*/

/*
    2:
    Also similarly to tableView(_:cellForRowAtIndexPath:), map views are set up to reuse annotation views
    when some are no longer visible. So the code first checks to see if a reusable annotation view is
    available before creating a new one.
*/

/*
    3:
    Here you use the plain vanilla MKAnnotationView class if an annotation view could not be dequeued.
    It uses the title and subtitle properties of your Artwork class to determine what to show in the
    callout – the little bubble that pops up when the user taps on the pin.
*/