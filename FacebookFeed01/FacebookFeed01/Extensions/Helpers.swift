import UIKit

extension UIView {
    func addConstraintsWithFormat(format:String, views:UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIColor {
    convenience init(hexString:String, alpha:CGFloat = 1.0) {
        let hexString:String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}

func buttonGenerator(title:String, imageName:String) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    
    // image has to be at size
    button.setImage(UIImage(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for: .normal)
    button.imageView?.tintColor = UIColor(hexString: "#ae0000")
    // top, left, bottom, right
    button.titleEdgeInsets = UIEdgeInsetsMake(2, 8, 0, 0)
    button.setTitleColor(UIColor(hexString: "#ae0000"), for: .normal)
    // button.titleEdgeInsets = UIEdgeInsets(top: 0,left: -30,bottom: 0,right: 34)
    
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    return button
}











