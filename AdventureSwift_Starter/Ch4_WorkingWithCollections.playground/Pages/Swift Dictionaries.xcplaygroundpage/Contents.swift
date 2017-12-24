/*:
 # Swift Dictionaries
 ---
 
 ## Topic Essentials
 Like arrays, dictionaries are collection types, but instead of holding single values accessed by indexes, they hold **key-value** pairs. All keys need to be of the same type, and the same goes for values. It's important to know that dictionary items are **unordered**, and their values are accessed with their associated keys.
 
 ### Objectives
 + Create a few empty dictionaries with different syntax
 + Create a dictionary called **blacksmithShopItems** and fill it with a few items
 + Use the `count` and `isEmpty` methods
 + Access all the keys and values of **blacksmithShopItems**
 + Iterate over **blacksmithShopItems** and print out its values and keys
 */
// dictionaries are unordered

// Creating dictionaries
// four ways to initilize a dictionary
var emptyDictionary1: Dictionary<Int, Int> = [:]
var emptyDictionary2 = Dictionary<Int, Int>()
var emptyDictionary3 = [Int:Int]()
var emtpyDictionary4: [Int:Int] = [:]

var blackSmithShop: Dictionary<String, Int> = ["Bottle": 10, "Sword": 15, "Ocarina": 1000]

// Count and isEmpty
blackSmithShop.count
blackSmithShop.isEmpty

// All keys and values
let allKeys = [String](blackSmithShop.keys)
let allValues = [Int](blackSmithShop.values)

// Accessing dict values
let shieldPrice = blackSmithShop["Sword"]
// returns an optional - to be covered later
let swordPrice = blackSmithShop["Shield"]

for (itemName, itemValue) in blackSmithShop {
    print("\(itemName) is \(itemValue)")
}
/*:
 [Previous Topic](@previous)
 
 [Next Topic](@next)
 */
