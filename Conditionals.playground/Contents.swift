import UIKit

var population:Int = 5422
var message:String
var otherMessage:String
var hasPostOffice:Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 500000{
    message = "\(population) is a medium size town."
} else {
//    if population >= 10000 && population < 50000 {
//        message = "\(population) is a medium size town."
//    } else {
        message = "\(population) is pretty big!"
//    }
}

print((message))

if !hasPostOffice {
    print("where do we buy stamps?")
}

otherMessage = population < 10000 ? "\(population) is a small town!" : "\(population) is pretty big!"

print((otherMessage))