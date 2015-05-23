import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainView = self.view
        
        let v1 = UIView(frame: CGRectMake(113, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1.0, green: 0.4, blue: 1.0, alpha: 1.0)
        
        let v2 = UIView(frame: v1.bounds.rectByInsetting(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0)
        
        mainView.addSubview(v1)
        v1.addSubview(v2)
        
        // change v2's bounds by changing its height and width
//        v2.bounds.size.height += 20
//        v2.bounds.size.width += 20
        
        // leave v2 where it is, but change v1's bounds origin within the superview
//        v1.bounds.origin.x += 10
//        v1.bounds.origin.y += 10
        
        // how to find the center of a view
//        let center = CGPointMake(v2.bounds.midX, v2.bounds.midY)
//        println("\(center)")
        
        // set a view center relative to another view
        // if the second parameter is nil, it is taken to be the window
        v2.center = v1.convertPoint(v1.center, fromCoordinateSpace: v1.superview!)
        
        // shear using matrix
        v1.transform = CGAffineTransformMake(1.0, 0.0, -0.2, 1.0, 0.0, 0.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

