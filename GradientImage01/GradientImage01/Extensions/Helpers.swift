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

extension UIImage {
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
}
