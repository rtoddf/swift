/*:
 # Basic strings
 ---
 
 ## Topic Essentials
 The Swift `String` class is a key building block of any application you build. A string is literally a collection of characters strung together that can be manipulated, mutated, and accessed in a variety of ways. The `String` class is Unicode compliant and can also handle standard special characters.

 ### Objectives
 + Create a string called **characterName** and assign it a value
 + Add another string to **fullCharacterName** using operator shorthand
 + Create a string called **characterDescription** and use string interpolation to insert **fullCharacterName**
 + Explore some of the common string class methods 
 */
// Declaring strings
var string1:String = ""
var string2 = String()

// Concatenation
var firstName:String = "todd"
var fullName:String = firstName + " fleeman"

// String interpolation


// Common class methods
fullName.count
fullName.isEmpty
/*:
 [Previous Topic](@previous)
 
 [Next Topic](@next)
 */
