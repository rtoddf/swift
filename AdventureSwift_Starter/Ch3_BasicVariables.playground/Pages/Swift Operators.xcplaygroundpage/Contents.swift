/*:
 # Basic Operators
 ---
 
 ## Topic Essentials
 Operators in Swift are used to perform various functions, such as value assignments, mathematics, equality and logic comparisons, and declaring ranges.
 
 ### Objectives
 + Understand the different operators and their basic uses
 */
// Arithmetic (+, -, /, *)
var usingMath:Int = 5 + 4 - 3 / 2 * 1
print(usingMath)

// Remainder/Modulo
var modulo:Int = 10%9
print(modulo)

// Compound assignments (+=, -=, *=, /=, %=)
var currentMP = 15
currentMP += 5

// Comparisons (==, !=, >, <, >=, <=)
if 5 == 5 {
    print("we are equal")
} else {
    print("we are not equal")
}

// Ternary operators
var hp:Int = 90
var bonusPoints = hp < 50 ? 25 : 50

// Logical operators (!, &&, ||)
var isRunning = true
var isJumping = !isRunning
isRunning && isJumping
isRunning || isJumping

// Ranges
/*
 Closed Range: 1...5
 Half-Open Range: 1..<5
 */

var array:Array = [1, 2, 3, 4, 5]

for number in 1...5 {
    print(number)
}

for number in 1..<5 {
    print(number)
}
/*:
 [Previous Topic](@previous)
 
 [Next Topic](@next)
*/

