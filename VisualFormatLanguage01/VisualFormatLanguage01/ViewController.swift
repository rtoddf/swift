import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    
    func setupViews(){
        let viewOne:UIView = {
            let view = UIView()
            view.backgroundColor = .orange
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        let viewTwo:UIView = {
            let view = UIView()
            view.backgroundColor = .purple
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        
        view.addSubview(viewTwo)
        view.addSubview(viewOne)
        
//        var allConstraints: [NSLayoutConstraint] = []
//        
//        let horizontalConstraintString = "H:|[v0][v1]|"
//        let verticalConstraintString = "V:|[v0]|"
        
//        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintString, options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne, "v1": viewTwo])
//        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintString, options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne])
//        let verticalConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintString, options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewTwo])
//
//        allConstraints += horizontalConstraints
//        allConstraints += verticalConstraints
//        allConstraints += verticalConstraints2
        
        view.addConstraintsWithFormat(format: "V:|[v0(200)][v1]|", views: viewOne, viewTwo)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: viewOne)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: viewTwo)
        
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-20-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne, "v1": viewTwo]))
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewTwo]))
//
//        NSLayoutConstraint.activate(allConstraints)
    }
}

