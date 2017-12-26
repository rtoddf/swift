// chapter 2 -> Back to Basics: Variables & Operators

import UIKit

// Operators in Swift

var assignmentOperator = "="
var mathOperators = "+, -, * , /"
var remainderOperator = "%"
var compoundOperators = "+=, -=, *="
var comparisonOperators = "==, !=, >, <, >=, <="

var logic = "!, &&, ||"
var closedRange = "value....value"
var halfOpenRange = "value..<value"


//  Declaring Variables & Types
var canChange = "This variable can change"
let cannotChange = "this variable cannot change. it's a constant"

canChange = "here's proof"
// cannotChange = "this should give an error"

// explicitly typed variable
var playerHealth_Explicit: Int = 100
// inferred typed variable
var playerHealth_Inferred = 100
// multiple explicitly typed variables
var playerDamage: Int, playerAttack: Int, playerGold: Double
// multiple types inferred variables
var enemyDamage, enemyAttack, enemyMana: Int

