import UIKit

class Drawing: UIView {
    
    override func drawLayer(layer: CALayer, inContext context: CGContext) {
        CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100))
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextFillPath(context)
    }

//    override func drawRect(rect: CGRect){
////        let p = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
////        
////        UIColor.blueColor().setFill()
////        
////        var strokeColor: UIColor = UIColor.redColor()
////        strokeColor.setStroke()
////        p.lineWidth = 1.5
////        
////        p.stroke()
////        p.fill()
//        
//        // using Core Graphics to do the same
//        let context = UIGraphicsGetCurrentContext()
//        
//        CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100))
//        
//        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
//        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
//        // line width defaults to 1 if not set
//        CGContextSetLineWidth(context, 4.0)
//        
//        // fill and stroke at the same time with the mode kCGPathFillStroke
//        CGContextDrawPath(context, kCGPathFillStroke)
//        
////        CGContextFillPath(context)
////        CGContextStrokePath(context)
//    }

}
