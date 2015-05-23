import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // autoresizing
        
        let mainView = self.view
        
        let v1 = UIView(frame: CGRectMake(100, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 0, green: 0.2, blue: 0.4, alpha: 1)
        
        let v2 = UIView(frame: CGRectMake(0, 0, 132, 10))
        v2.backgroundColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
        
        let v3 = UIView(frame: CGRectMake(v1.bounds.width - 20, v1.bounds.height - 20, 20, 20))
        v3.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
        
        mainView.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        
        // set struts and springs so if the superview changes, things will stay in proportion
        v2.autoresizingMask = .FlexibleWidth
        v3.autoresizingMask = .FlexibleTopMargin | .FlexibleLeftMargin
        
        // resizing v1
//        v1.bounds.size.width += 40
//        v1.bounds.size.height -= 50
        
        // pinning v1 to the root view's frame
        v1.frame = mainView.bounds
        v1.autoresizingMask = .FlexibleHeight | .FlexibleWidth
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

