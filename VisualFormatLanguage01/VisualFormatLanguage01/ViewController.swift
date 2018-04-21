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
        
        let viewThree:UIView = {
            let view = UIView()
            view.backgroundColor = .blue
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        view.addSubview(viewOne)
        view.addSubview(viewTwo)
        view.addSubview(viewThree)
        
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
        
        let width = view.frame.width / 3
        
//        view.addConstraintsWithFormat(format: "V:|[v0(\(height))][v1(\(height))][v2]|", views: viewOne, viewTwo, viewThree)
        
        view.addConstraintsWithFormat(format: "H:|-10-[v0(>=100,<=\(width))]-10-[v1(==v0)]-10-[v2(==v0)]-10-|", views: viewOne, viewTwo, viewThree)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: viewOne)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: viewTwo)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: viewThree)
        
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-20-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne, "v1": viewTwo]))
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewTwo]))
//
//        NSLayoutConstraint.activate(allConstraints)
    }
}

