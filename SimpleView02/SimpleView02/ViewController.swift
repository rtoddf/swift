import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myView:UIView = {
            let view = UIView()
            view.backgroundColor = .orange
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 25
            view.layer.borderWidth = 5
            view.layer.borderColor = UIColor.purple.cgColor
            return view
        }()
        
        view.addSubview(myView)
        
        // Get the superview's layout
        let margins = view.layoutMarginsGuide
        // let margins = view.safeAreaLayoutGuide
        // constant is oan offset
        // multiplier is just that
        
        // Pin the top edge of myView to the margin's top edge
        myView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50).isActive = true
        
        // Pin the leading edge of myView to the margin's leading edge
        myView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        
        // Pin the trailing edge of myView to the margin's trailing edge
        myView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Give myView a 1:1 aspect ratio
        myView.heightAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 1.0).isActive = true
    }

}

