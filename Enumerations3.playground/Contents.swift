import UIKit

enum ShapeDimensions {
    // point has no associated value - it is dimensionless
    case Point
    
    // square's associated value is the length of one side
    case Square(Double)
    
    // rectangle's associated value defines its width and height
    case Rectangle(width:Double, height: Double)
    
    func area() -> Double {
        switch self {
            case .Point:
                return 0
            
            case let .Square(side):
                return side * side
            
        
            case let .Rectangle(width: w, height: h):
                return w * h
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectangleShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point

print("the square's area: \(squareShape.area())")
print("the rectangle's area: \(rectangleShape.area())")
print("the point's area: \(pointShape.area())")
