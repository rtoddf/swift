import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myView:UIView = {
            let view = UIView()
            view.backgroundColor = .orange
            view.translatesAutoresizingMaskIntoConstraints = false
//            view.layer.cornerRadius = 25
//            view.layer.borderWidth = 5
//            view.layer.borderColor = UIColor.purple.cgColor
            return view
        }()
        
        view.addSubview(myView)
        
        // Layout Anchors
        // Get the superview's layout
        // let margins = view.layoutMarginsGuide
        // let margins = view.safeAreaLayoutGuide
        // constant is oan offset (defaults to 0.0)
        // multiplier is just that (defaults to 1.0)
        
        // Pin the top edge of myView to the margin's top edge
        // myView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50).isActive = true
        
        // Pin the leading edge of myView to the margin's leading edge
        // myView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        
        // Pin the trailing edge of myView to the margin's trailing edge
        // myView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Give myView a 1:1 aspect ratio
        // myView.heightAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 1.0).isActive = true
        
        /***
         NSLayoutConstraint Class
         You can freely create invalid constraints. These constraints then throw an exception at runtime. Therefore, unless you need to support iOS 8 or OS X v10.10 or earlier, consider migrating your code to the newer layout anchor API.
        ***/
        
//        NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 50).isActive = true
//        NSLayoutConstraint(item: myView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 50).isActive = true
//        NSLayoutConstraint(item: myView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -50).isActive = true
//        NSLayoutConstraint(item: myView, attribute: .height, relatedBy: .equal, toItem: myView, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        
        
        // Visual Format Language
        // 
        let views = ["v0" : myView]
        let horizontalFormatString = "H:|-[v0]-|"
        let verticalFormatString = "V:|-[v0]-20-|"

        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalFormatString, options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalFormatString, options: [], metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraints)
        self.view.addConstraints(verticalConstraints)
    }

}

