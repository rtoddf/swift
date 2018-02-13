import UIKit

class ViewController: UIViewController {
    
    var imageView:UIImageView = {
        let iv = UIImageView()
        
        let image = UIImage(named: "personalities-charlie-carver")
        let gradientImage:UIImage = imageWithGradient(img: image)
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

func imageWithGradient(img:UIImage!) -> UIImage {
    
    UIGraphicsBeginImageContext(img.size)
    let context = UIGraphicsGetCurrentContext()
    
    img.draw(at: CGPoint(x: 0, y: 0))
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let locations:[CGFloat] = [0.0, 1.0]
    
    let bottom = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
    let top = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
    
    let colors = [top, bottom] as CFArray
    
    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations)
    
    let startPoint = CGPoint(x: img.size.width/2, y: 0)
    let endPoint = CGPoint(x: img.size.width/2, y: img.size.height)
    
    context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return image!
}
