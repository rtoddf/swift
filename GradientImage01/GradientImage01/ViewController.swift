import UIKit

class ViewController: UIViewController {
    
    var imageView:UIImageView = {
        let iv = UIImageView()
        
        if let image = UIImage(named: "personalities-charlie-carver") {
            iv.image = image.imageWithGradient(img: image, colors: [UIColor(hexString: "#222222"), UIColor(hexString: "#003264")], alphas: [0.0, 0.75], locations: [0.0, 1], points: [0.5, 1])
        }
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hexString: "#222222")
        setLayout()
    }
    
    func setLayout(){
        view.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
