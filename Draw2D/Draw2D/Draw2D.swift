import UIKit

class Draw2D: UIView {

    override func drawRect(rect: CGRect) {
        /*
            In order to draw a line on a device screen using Quartz 2D
            we first need to obtain the graphics context for the view
        */
        let context  = UIGraphicsGetCurrentContext()
        
        /*  the width of the line we plan to draw needs to be specified: */
        // float
        CGContextSetLineWidth(context, 2.0)
        
        /* we need to create a color reference */
        /* why do we set a color reference? */
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
        let color = CGColorCreate(colorSpace, components)
        
        /*
        Using the color reference and the context we can now specify
        that the color is to be used when drawing the line
        */
        // CGContextSetStrokeColorWithColor(context, color)
        
        /* the above color reference can be done in less code: */
        let strokeColor = UIColor.redColor().CGColor
        let myColor = UIColor(red: 1, green: 0.0, blue: 1, alpha: 1).CGColor
        let myBlue = UIColor(red: 0, green: 50/255, blue: 100/255, alpha: 1.0).CGColor
        
        // set stroke and fill colors
        CGContextSetStrokeColorWithColor(context, myColor)
        CGContextSetFillColorWithColor(context, myBlue)
        
        // draw a diamond
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 150, 150)
        CGContextAddLineToPoint(context, 100, 200)
        CGContextAddLineToPoint(context, 50, 150)
        CGContextAddLineToPoint(context, 100, 100)
        
        // draw a rectangle
        let rectangle = CGRectMake(60, 170, 200, 80)
        CGContextAddRect(context, rectangle)
        CGContextAddEllipseInRect(context, rectangle)
        
        CGContextStrokePath(context)
        // for just a fill, use this:
//        CGContextFillPath(context)
        // for a fill and stroke, use this:
        CGContextFillRect(context, rectangle)
        
        // draw an arc
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddArcToPoint(context, 100, 200, 300, 200, 100)
        CGContextStrokePath(context)
        
        // draw a bezier curve
        CGContextMoveToPoint(context, 10, 10)
        CGContextAddCurveToPoint(context, 0, 150, 300, 250, 300, 400)
        
        CGContextStrokePath(context)
    }

}
