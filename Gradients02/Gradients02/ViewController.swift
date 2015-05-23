import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayerView: UIView?
    
//        let gradient = CAGradientLayer().blueGradient(UIColor.redColor())
        
        gradientLayerView = UIView(frame: CGRectMake(0, 0, 100, 100))
        
        let gradient = CAGradientLayer().overlayGradient()
        
        gradient.frame = self.view.bounds
        
        gradientLayerView.view.background = UIColor.redColor()
//        self.gradientLayerView!.layer.insertSublayer(gradient, atIndex: 5)
        
        
//        gradientLayerView.insertSublayer(gradient, atIndex: 0)
        
        self.view.addSubview(gradientLayerView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

