import UIKit

enum TextAlignment: Int {
    case Left
    case Right
    case Center
    case Justify
}

//var alignment:TextAlignment = TextAlignment.Left
var alignment = TextAlignment.Left
// reassign
alignment = .Right

if alignment == .Right {
    print("right align the text")
}

// if will work, but switch cases are preferred
switch alignment {
case .Left:
    print("we should go left")
case .Right:
    print("we should go right")
case .Center:
    print("we should go center")
case .Justify:
    print("we justify")
}

//using raw values - ints

print("left has a raw value of \(TextAlignment.Left.rawValue)")


enum ProgrammingLanguages:String {
    case Swift
    case ObjectiveC = "Objective-C"
    case C
    case Cpp        = "C++"
    case Java
}

let myFavoriteLanguages = ProgrammingLanguages.Cpp
print("My favorite programming language is \(myFavoriteLanguages.rawValue)")
