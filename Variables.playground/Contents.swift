import UIKit

let numberOfStopLights:Int = 4
var population:Int

population = 5422
var message:String
var hasPostOffice:Bool = true

var levelOfEmployment:Float = 90.5
let townName:String = "Nowhere"
var townDescription:String = "\(townName) has a population of \(population), the level of employemnt is \(levelOfEmployment)% and \(numberOfStopLights) stop lights."

print(townDescription)


if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
    message = "this is a medium town"
} else {
    message = "\(population) is really big!"
}

//message = population < 10000 ? "\(population) is a small town!" : "\(population) is really big!"

print(message)

if !hasPostOffice {
    print("where can I buy stamps?")
}

