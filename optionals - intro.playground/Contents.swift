import UIKit

var result:Int? = 30
// result is an optional, not Int
print(result)
// thus, you can't add 1
//print(result + 1)

var authorName:String? = "Stepen King"
//var authorName:String? = nil
var authorAge:Int? = 62
//var authorAge:Int? = nil

// force unwrapping is never a good idea - what if it's nil?
//var authorNameUnwrapped = authorName!

// optional binding
// you can do multiple values
if let authorName = authorName,
    let authorAge = authorAge {
    print("Author name is \(authorName) and he is \(authorAge)")
} else {
    print("No author or age")
}


// you can also use guard - check the examples downloaded - more-optionals
func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square":
        return 4
    case "Rectangle":
        return 4
    case "Pentagon":
        return 5
    case "Hexagon":
        return 6
    default:
        return nil
    }
}

func maybePrintSides(shape:String) {
    let sides = calculateNumberOfSides(shape: shape)
    
    if let sides = sides {
        print("A \(shape) has \(sides) sides.")
    } else {
        print("I don't know the number of sides for \(shape).")
    }
}

maybePrintSides(shape: "Square")
maybePrintSides(shape: "Pentagon")
maybePrintSides(shape: "Octopus")

func maybePrintSides2(shape:String) {
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("I don't know the number of sides for \(shape).")
        return
    }
    print("A \(shape) has \(sides) sides.")
}

maybePrintSides2(shape: "Triangle")
maybePrintSides2(shape: "Hexagon")
maybePrintSides2(shape: "Elephant")


// nil coalescing
//var optionalInt: Int? = 10
var optionalInt: Int? = nil
var mustHaveResult = optionalInt ?? 0






