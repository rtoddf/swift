import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setStackViews()
    }
    
    let redView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#ae0000")
        return view
    }()
    
    let greenView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#baba71")
        return view
    }()
    
    let blueView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#003264")
        return view
    }()
    
    func setStackViews(){
        let stackView = UIStackView(arrangedSubviews: [redView, greenView, blueView])
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // options
        /*
         stackView.axis = .Horizontal
         stackView.distribution = .FillEqually
         stackView.alignment = .Fill
         stackView.spacing = 5
         */
        
        view.addSubview(stackView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": stackView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": stackView]))
        
//        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

