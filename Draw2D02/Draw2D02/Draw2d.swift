import UIKit

class Draw2d: UIView {

    override func drawRect(rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        
//        let purpleColor = UIColor.purpleColor().CGColor
//        
//        CGContextSetLineWidth(context, 10.0)
//        CGContextSetStrokeColorWithColor(context, purpleColor)
//        
//        let dashArray:[CGFloat] = [2, 2, 2, 2]
//        // [2,6,4,2]
//
//        /*
//        context – The graphics context of the view on which the drawing is to take place
//        phase - A floating point value that specifies how far into the dash pattern the line starts
//        lengths – An array containing values for the lengths of the painted and unpainted sections of the line. For example an array containing 5 and 6 would cycle through 5 painted unit spaces followed by 6 unpainted unit spaces.
//        count – A count of the number of items in the lengths array
//        */
//        CGContextSetLineDash(context, 3, dashArray, 4)
//        
//        CGContextMoveToPoint(context, 10, 200)
//        CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200)
//        
//        CGContextStrokePath(context)
        
        let context = UIGraphicsGetCurrentContext()
        let myShadowOffset = CGSizeMake (2, 2)

        // why is this here?
        /*
        To turn off shadowing:
        
        Use the standard save/restore mechanism for the graphics state.
        
        Use CGContextSetShadowWithColor to set the shadow color to a fully transparent color (or pass NULL as the color).
        */
//        CGContextSaveGState(context)
        
        CGContextSetShadow(context, myShadowOffset, 5)
        CGContextSetShadowWithColor(context, myShadowOffset, 5, UIColor.blueColor().CGColor)
        
        CGContextSetLineWidth(context, 4.0)
        CGContextSetStrokeColorWithColor(context,
            UIColor.orangeColor().CGColor)
        let rectangle = CGRectMake(60,170,200,80)
        CGContextAddEllipseInRect(context, rectangle)
        CGContextStrokePath(context)
        // why is this here?
//        CGContextRestoreGState(context)
    }

}
