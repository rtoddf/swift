import UIKit

class ViewController: UIViewController {
    
    var imageView:UIImageView = {
        let iv = UIImageView()
        
        let image = UIImage(named: "personalities-charlie-carver")
        
        let color1 = UIColor(hexString: "#baba71")
        let color2 = UIColor(hexString: "#baba71")
        
        let gradientImage:UIImage = imageWithGradient(img: image, colors: [color1, color2], alphas: [0.0, 0.5], locations: [0.0, 0.5])
        iv.image = gradientImage
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hexString: "#333333")
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

func imageWithGradient(img:UIImage!, colors:[UIColor], alphas:[CGFloat], locations:[CGFloat]) -> UIImage {
    
    UIGraphicsBeginImageContext(img.size)
    let context = UIGraphicsGetCurrentContext()
    
    img.draw(at: CGPoint(x: 0, y: 0))
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let locations:[CGFloat] = [locations[0], locations[1]]

    let colors = [colors[1].withAlphaComponent(alphas[0]).cgColor, colors[0].withAlphaComponent(alphas[1]).cgColor] as CFArray
    
    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations)
    
    let startPoint = CGPoint(x: img.size.width/2, y: 0)
    let endPoint = CGPoint(x: img.size.width/2, y: img.size.height)
    
    context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return image!
}
