import UIKit

/*
An integer is a number that does not have a decimal point or fractional component - a whole number. Integers are frequently used to represent a count of "things", such as hte number of pages of a book. A difference between integers and used by computers and numbers you use elsewhere is that an integer type on a computer takes up a fixed amount of memory. Therefore, they cannot represent all possible values - they have a minimum and maximum value.

*/

print("the maximum Int value is \(Int.max)")
print("the minumum Int value is \(Int.min)")

/*
In OSX, Int is a 64-bit integer, which means is has 2 to the 64th power possible values. If you were to add up 2 to the 0 power, 2 to the 1st power, .... 2 to the 62nd power, you would end up with 9223372036854775807 - the value for Int max.

In iOS, Int is slightly more complicated. All devices before the iPhone 5S, iPad Air, and iPad mini with retina display, used a 32-bit architecture, and you get a 32-bit Int. All devices after are 64-bit. The compiler determines the appropriate size for Int when it build your program.

If you need to know the exact size of an integer, you can use on of Swift's explicit sized integer types:
*/

print("the max Int value in 32-bit is \(Int32.max)")
print("the min Int value in 32-bit is \(Int32.min)")

/*
Also available are Int8, Int16, and Int64. You use the sized integer types when you need to know the size of an underlying integer, such as for some algorithms (common in cryptography) or to exchange integers with another computer (such as sesnding data across the Internet).

You will not use these types much. Good Swift style is to use an Int for most use cases.
*/

/*
All the ints you have seen so far, are signed. Which means that they can represent positive or negative numbers. Swift also has an unsigned integer type that can represent integers greater than 0.
*/

print("the maximum UInt value is \(UInt.max)")
print("the minimum UINT value is \(UInt.min)")


let numberOfPages:Int = 10
let numberOfChapters = 3

let numberOfPeople:UInt = 40
let volumeAdjustment:UInt = 1000

// UInt cannot be negative, and 200 is not an Int8 integer, so we have to use Integer overflow to take care of hte error

//let firstBadValue:UInt = -1
//let secondBadValue:Int8 = 200

// "Overflows when stored into..." means that when the compiler tried to store your number into the type you specified, and it did not fit in the type's allowed range of values.

// integer division
print(11/3)

// swift truncates the fractional part. Integer division always rounds toward 0. 

// use modulus if you want remainders
print(11 % 3)

// incrementing and decrementing
var x = 10
x++
print("x incremented is \(x)")
x--
print("x decremented is \(x)")

// OVERFLOW OPERATORS
let y:Int8 = 120
//let z = y + 10

// execution was interrupted - this was out of range fo Int8

let z = y &+ 10
print("\(z)")

// since y is an Int8, once you get to 127, you cannot go any higher. Instead, incrementing one more wraps you around to -128

// converting int types
let a:Int16 = 200
let b:Int8 = 50
//let c = a + b

let c = a + Int16(b)
print("\(c)")

// FLOATING POINT NUMBERS



