import UIKit

var num:Int = 1
var name:String = "todd"

// user repeat, not while
repeat {
    print(num)
    if num == 5 {
        // break
        break
    }
    num += 1
} while num < 10

var sum:Int = 0
let count:Int = 10

for i in 1...count {
    sum += i
}

sum

for i in 1...count where i % 2 == 1 {
    print("the number is \(i)")
}

for i in 1...count {
    print("todd")
    // continue goes back to the top of the for loop and then keeps running
    if i == 3 { continue }
    print("fleeman")
}

let number = 4

switch number {
    case 0:
        print("0")
    case 1...9:
        print("between 1 and 9")
    case 10:
        print("10")
    default:
        print("default")
}

switch number {
    case _ where number % 2 == 0:
        print("even number")
    default:
        print("no numbers")
}

let string:String = "dog"

switch string {
    case "cat", "bird", "mouse":
        print("cat")
    case "dog":
        print("dog")
    default:
        print("undefined")
}




