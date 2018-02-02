import UIKit

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

extension UIImageView {
    func setDisplay(size:CGFloat) {
        frame = CGRect(x: 0, y: 0, width: size, height: size)
        contentMode = .scaleAspectFill
    }
}

extension UIView {
    func anchor(top:NSLayoutYAxisAnchor?, leading:NSLayoutXAxisAnchor?, bottom:NSLayoutYAxisAnchor?, trailing:NSLayoutXAxisAnchor?, padding:UIEdgeInsets = .zero, size:CGSize = .zero) {
        
//        let viewCornerRadius:CGFloat = 8.0
        let viewBackgroundColor = UIColor(hexString: "#333333")
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = viewBackgroundColor
//        layer.cornerRadius = viewCornerRadius
        clipsToBounds = true
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        
        //        topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        
        //        guard let top = top else { return }
        //        guard let leading = leading else { return }
        //        guard let bottom = bottom else { return }
        //        guard let trailing = trailing else { return }
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        // bottom and right padding have to be nagative
    }
}
