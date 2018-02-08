import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    let mapView:UIView = {
        let mv = UIView()
        mv.backgroundColor = UIColor(hexString: "#ae0000")
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()
    
    func setupViews(){
        view.addSubview(mapView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": mapView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(300)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": mapView]))
    }
}

