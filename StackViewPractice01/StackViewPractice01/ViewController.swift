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
    
    let darkGrayView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#666666")
        return view
    }()

    let lightGrayView:UIView = {
        let thisView = UIView()
        thisView.backgroundColor = UIColor(hexString: "#cccccc")
        
        let imageName = "gideon-glick"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        thisView.addSubview(imageView)
        
        thisView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        thisView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        
        return thisView
    }()
    
    func setStackViews(){
        let subStackView = UIStackView(arrangedSubviews: [redView, greenView, blueView])
        subStackView.distribution = .fillEqually
        subStackView.spacing = 5
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [lightGrayView, subStackView, darkGrayView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
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
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-22-[v0(1000)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": stackView]))
        
        let width = self.lightGrayView.frame.size
        print("width: \(width)")
    }
}

