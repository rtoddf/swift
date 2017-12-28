import UIKit

// functions are methods that don't belong to an object
// methods belong to objects

func printMyName() {
    print("My name is Todd")
}

printMyName()


func printMultipleFive(value:Int){
    print("\(value) * 5 = \(value * 5)")
}

printMultipleFive(value: 6)

func printMultipleOf(_ multiplier: Int, and value: Int){
    print("\(multiplier) * \(value) = \(multiplier * value)")
}

printMultipleOf(2, and: 10)

func multiply(_ multiplier: Int, and value: Int) -> Int {
    print("\(multiplier) * \(value) = \(multiplier * value)")
    return multiplier * value
}

let result:Int = multiply(5, and: 50)

func multiplyAndDivide(_ number:Int, by factor:Int) -> (product:Int, quotient:Int) {
    return (number * factor, number / factor)
}

let results = multiplyAndDivide(4, by: 2)
let (product, quotient) = results

product
quotient
