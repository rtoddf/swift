import UIKit

//var groceryBag = Set<String>()
//
//groceryBag.insert("apple")
//groceryBag.insert("banana")
//groceryBag.insert("orange")

//var groceryBag = Set(["apple", "banana", "orange"])
var groceryBag:Set = ["apple", "banana", "orange"]

groceryBag

for food in groceryBag {
    print(food)
}

let hasPear = groceryBag.contains("pear")

let friendsGroceryBag:Set = ["banana", "apple", "watermelon", "paper towels"]

let commonGroceryBag = groceryBag.union(friendsGroceryBag)


let itemsToReturn = groceryBag.intersect(friendsGroceryBag)