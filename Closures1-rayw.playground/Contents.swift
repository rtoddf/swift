import UIKit

// methods are methods without names

//var multiplyClosure:(Int, Int) -> Int
// long form:
//multiplyClosure = { (a:Int, b:Int) -> Int in
//    return a * b
//}

var multiplyClosure:(Int, Int) -> Int = { a, b in
    return a * b
}

var addClosure:(Int, Int) -> Int = { a, b in
    return a + b
}

let result = multiplyClosure(4, 2)

// third passed param is a closure
func operateOnNumbers(_ a:Int, _ b:Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}

operateOnNumbers(2, 4, operation: multiplyClosure)
operateOnNumbers(2, 4, operation: addClosure)

// you can write the closure inline
operateOnNumbers(4, 2, operation: { $0 / $1 })

// what if there are no params or return
// same but not as widely used
//let voidClosure: () -> () = {
let voidClosure: () -> Void = {
    print("something is amiss")
}

voidClosure()

// powerful feature of closures - capturing
var counter = 0
let incrementCounter = {
    counter += 1
}


// http://goshdarnclosuresyntax.com/
// http://fuckingswiftblocksyntax.com/








