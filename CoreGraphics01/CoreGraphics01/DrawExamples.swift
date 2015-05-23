import UIKit

class DrawExamples: UIView {

    override func drawRect(rect: CGRect) {
        // context is the object used for drawing
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, 3.0)
        CGContextSetStrokeColorWithColor(context, UIColor.orangeColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.orangeColor().CGColor)
        
        // straight line
//        CGContextMoveToPoint(context, 0, 0)
//        CGContextAddLineToPoint(context, 300, 200)
        
        // custom shapes
//        CGContextMoveToPoint(context, 50, 50)
//        CGContextAddLineToPoint(context, 100, 50)
//        CGContextAddLineToPoint(context, 150, 100)
//        CGContextAddLineToPoint(context, 100, 150)
//        CGContextAddLineToPoint(context, 50, 150)
//        CGContextAddLineToPoint(context, 0, 100)
//        CGContextAddLineToPoint(context, 50, 50)
        
        // recatangle
        let rectangle = CGRectMake(0, 0, 200, 400)
        CGContextAddRect(context, rectangle)

        // draw the path
        // CGContextStrokePath(context)
        CGContextFillPath(context)
    }

}