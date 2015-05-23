import UIKit

// per http://www.developerdave.co.uk/2014/10/gradient-backgrounds-swift/
//extension CAGradientLayer {
//
//    func turquoiseColor() -> CAGradientLayer {
//        let topColor = UIColor(red: (15/255.0), green: (118/255.0), blue: (128/255.0), alpha: 1)
//        let bottomColor = UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1)
//
//        let gradientColors: Array <AnyObject> = [topColor.CGColor, bottomColor.CGColor]
//        let gradientLocations: Array <AnyObject> = [0.0, 1.0]
//
//        let gradientLayer: CAGradientLayer = CAGradientLayer()
//        gradientLayer.colors = gradientColors
//        gradientLayer.locations = gradientLocations
//
//        return gradientLayer
//    }
//}

class Gradient: UIView {
    override func drawRect(rect: CGRect) {
        var imageHeight = bounds.size.width * 0.66

        var imageView: UIImageView!
        imageView = UIImageView(image: UIImage(named: "arno_dorian.png"))
        imageView.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: imageHeight)
        self.addSubview(imageView)
        
        var gradientLayerView: UIView = UIView(frame: CGRectMake(0, 0, bounds.size.width, imageHeight))
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientLayerView.bounds
        
        gradient.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor,
            UIColor.clearColor().CGColor,
            UIColor.clearColor().CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
        ]
        
        gradient.locations = [ 0.0, 0.2, 0.8, 1.0]
        
        gradientLayerView.layer.insertSublayer(gradient, atIndex: 5)
        self.layer.insertSublayer(gradientLayerView.layer, atIndex: 5)
        
        //        let background = CAGradientLayer().turquoiseColor()
        //        background.frame = self.view.bounds
        //        self.view.layer.insertSublayer(background, atIndex: 0)
        
        //        let myGradientLayer: CAGradientLayer
        //        myGradientLayer = CAGradientLayer()
        //        myGradientLayer.startPoint = CGPoint(x: 0, y: 0)
        //        myGradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //        let colors: [CGColorRef] = [
        //            UIColor.clearColor().CGColor,
        //            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor,
        //            UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).CGColor,
        //            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor,
        //            UIColor.clearColor().CGColor ]
        //        myGradientLayer.colors = colors
        //        myGradientLayer.opaque = false
        //        myGradientLayer.locations = [0.0,  0.3, 0.5, 0.7, 1.0]
        //        self.view.layer.addSublayer(myGradientLayer)
        
        
//        let context = UIGraphicsGetCurrentContext()
//        
//        let locations: [CGFloat] = [ 0.0, 0.1, 0.9, 1.0]
//        
//        let colors: [CGColorRef] = [
//            UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor,
//            UIColor.clearColor().CGColor,
//            UIColor.clearColor().CGColor,
//            UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
//        ]
//        
//        let colorspace = CGColorSpaceCreateDeviceRGB()
//        
//        let gradient = CGGradientCreateWithColors(colorspace,
//            colors, locations)
//        
//        var startPoint = CGPoint()
//        var endPoint =  CGPoint()
//        
//        startPoint.x = 0.0
//        startPoint.y = 0.0
//        endPoint.x = 0.0
//        endPoint.y = 300.0
//        
//        CGContextDrawLinearGradient(context, gradient,
//            startPoint, endPoint, 0)
    }
}
