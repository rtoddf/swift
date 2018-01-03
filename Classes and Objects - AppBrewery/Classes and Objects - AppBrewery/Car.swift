import Foundation

// most devs do enums at the top
// custom data type
enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    var color = "black"
    var numberOfSeats:Int = 5
    
    // enums - enumerations (create a new data type)
    var typeOfCar:CarType = .Coupe
    
    // init is a designated initializer
//    init(customerChosenColor:String) {
//        color = customerChosenColor
//    }
    
    // convenience init is a conv init because it is not required to create
    convenience init(customerChosenColor:String) {
        self.init()
        color = customerChosenColor
    }

}

