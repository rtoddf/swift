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

let yourSecondBag:Set = (["berries", "yogurt"])
let roommatesSecondBag:Set = (["grapes", "honey"])

let disjoint = yourSecondBag.isDisjointWith(roommatesSecondBag)
// returns true if the sets do not have matching items

let myCities:Set = (["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities:Set = (["Chicago", "San Francisco", "Jacksonville"])

let isSuper = myCities.isSupersetOf(yourCities)
let isStrictSuper = myCities.isStrictSupersetOf(yourCities)

//http://www.codingexplorer.com/swift-set-type/