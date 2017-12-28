import UIKit

// overloading functions means you can have two functions with the same name, but there are diff things about each

// passed vars to a function are constants - you can't change them
// if you want to change the vars passed to a function, you have to use inout

func incrementAndPrint(_ value: inout Int){
    value += 1
    print(value)
}

var value3:Int = 5
incrementAndPrint(&value3)

// assigning a function to a variable
func add(_ a:Int, _ b:Int) -> Int {
    return a + b
}

//var function = add
//function(5, 5)

func subtract(_ a:Int, _ b:Int) -> Int {
    return a - b
}

//function = subtract
//function(5, 5)

// now we can pass a function to a function
// you can also use typealias
typealias operation = (Int, Int) -> (Int)
func printResult(_ function: operation, _ a:Int, _ b:Int) {
    let result = function(a, b)
    print(result)
}

// rather than the long way below:
//func printResult(_ function: (Int, Int) -> (Int), _ a:Int, _ b:Int) {
//    let result = function(a, b)
//    print(result)
//}

printResult(add, 4, 2)
printResult(subtract, 5, 5)
