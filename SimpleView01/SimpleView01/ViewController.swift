import UIKit

// http://swiftdeveloperblog.com/code-examples/create-uiview-in-swift-programmatically/
// https://makeapppie.com/2014/07/26/the-swift-swift-tutorial-how-to-use-uiviews-with-auto-layout-programmatically/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tileDimension:CGFloat = 200
        
        let myView:UIView = {
            let view = UIView(frame: CGRect(x: (self.view.frame.size.width/2) - (tileDimension/2), y: (self.view.frame.size.height/2) - (tileDimension/2), width: tileDimension, height: tileDimension))
            view.backgroundColor = .orange
            view.layer.cornerRadius = 25
            view.layer.borderWidth = 2
            view.layer.borderColor = UIColor.purple.cgColor
            return view
        }()
        
        self.view.addSubview(myView)
    }
}

