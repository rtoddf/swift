import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainView = self.view
        let p = UIView(frame: CGRectMake(50, 50, 50, 50))
        let r = UIView(frame: CGRectMake(75, 75, 50, 50))
        let g = UIView(frame: CGRectMake(100, 100, 50, 50))
        let y = UIView(frame: CGRectMake(125, 125, 50, 50))
        
        r.backgroundColor = UIColor.redColor()
        g.backgroundColor = UIColor.greenColor()
        p.backgroundColor = UIColor.purpleColor()
        y.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 0.7)
        
        mainView.addSubview(g)
        mainView.addSubview(p)
        mainView.addSubview(r)
        mainView.addSubview(y)
        
        p.transform = CGAffineTransformMakeRotation(45 * CGFloat(M_PI)/180.0)
        g.transform = CGAffineTransformMakeScale(1.5, 1.5)
        
//        p.hidden = true
        r.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

