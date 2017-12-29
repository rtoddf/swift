import UIKit

// Creating dictionaries
// four ways to initilize a dictionary
var emptyDictionary1: Dictionary<Int, Int> = [:]
var emptyDictionary2 = Dictionary<Int, Int>()
var emptyDictionary3 = [Int:Int]()
var emtpyDictionary4: [Int:Int] = [:]

// setting a value of a specific key to nil removes it from the dictionary

// sets
// sets only have unique values

var someSet:Set<Int> = [1, 2, 3, 1]
someSet.contains(1)
someSet.insert(5)
someSet.remove(2)
