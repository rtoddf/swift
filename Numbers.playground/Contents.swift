import UIKit

print("The max Int value is \(Int.max)")
print("The min Int value is \(Int.min)")
print("The max 32-bit Int value is \(Int32.max)")

// there is also Int8, Int16, and Int64
// all the integer types are signed - can represent positive and negative numbers
// there are also unsigned integer types for whole number greater than 0
// every int type has a corresponding uint type
// UInt8, UInt16, etc

print("The max UInt value is \(UInt.max)")
print("The min UInt value is \(UInt.min)")


let numberOfPages:Int = 10
let numberOfChapters = 3


let numberOfPeople:UInt = 40
let volumeAdjustment:UInt32 = 100

print(10 + 2)

// division on Ints returns just that - Ints
print(11/3)

//remainders too
print(11%3)

//shorthand
var x = 10
x += 1

print(x)

x -= 1

print(x)

// overflow and underflow operators
// &+, &-, &* use wraparound

let y:Int8 = 120
let z = y &+ 10
print(z)

//floating point numbers
// two types - Float and Double: Float is 32-bit and Double is 64-bit. Double is more a more accurate approximation

