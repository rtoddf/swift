import UIKit

class ViewController: UIViewController {
    
    var imageView:UIImageView = {
        let iv = UIImageView()
        
        let image = UIImage(named: "personalities-charlie-carver")
        
        let gradientImage:UIImage = imageWithGradient(img: image, colors: [UIColor(hexString: "#222222"), UIColor(hexString: "#222222")], alphas: [0.0, 0.75], locations: [0.0, 1], points: [0.5, 1])
        iv.image = gradientImage
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

func imageWithGradient(img:UIImage!, colors:[UIColor], alphas:[CGFloat], locations:[CGFloat], points:[CGFloat]) -> UIImage {
    
    UIGraphicsBeginImageContext(img.size)
    let context = UIGraphicsGetCurrentContext()
    
    img.draw(at: CGPoint(x: 0, y: 0))
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    var gradientLocations = [CGFloat]()
    var gradientColors = [CGColor]()

    for location in locations { gradientLocations.append(location) }
    
    for pair in zip(colors, alphas) { gradientColors.append(pair.0.withAlphaComponent(pair.1).cgColor) }
    
    let gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors as CFArray, locations: gradientLocations)
    let startPoint = CGPoint(x: img.size.width/2, y: img.size.height * points[0])
    let endPoint = CGPoint(x: img.size.width/2, y: img.size.height * points[1])
    
    context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return image!
}
