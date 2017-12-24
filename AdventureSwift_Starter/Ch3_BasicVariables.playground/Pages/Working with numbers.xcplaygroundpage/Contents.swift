/*:
 # Working with numbers
 ---
 
 ## Topic Essentials
 The Swift compiler will do the majority of the work to infer the correct result type when mathematic operators are used on number variables. Be aware that in some cases you will need to specify the result type if you want something specific. In other words, the compiler is very smart and will deliver the correct result type, but that might not be the type you want.
 
 ### Objectives
 + Create a variable called **goldCarried** and assign it a value of 5.43
 + Convert **goldCarried** to other number types, such as `Double` and `String`
 + Add different number types together with and without type annotations
 */
// Test variables
var goldAsDouble:Double = 5.43

// Explicit conversions
var goldAsInt:Int = Int(goldAsDouble)
var goldAsString:String = String(goldAsDouble)

// Inferred conversion with operators
var goldResultImplicit = 37 + 2.55
var goldResultExplicit = Double(goldAsInt) + goldResultImplicit

/*:
 [Previous Topic](@previous)
 
 [Next Topic](@next)
 */
