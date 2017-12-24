/*:
 # Core Array Methods
 ---
 
 ## Topic Essentials
 Now that we know how to create and access arrays, we need to learn how to manipulate them. Arrays come with several handy methods out of the box, including `append`, `insert`, `remove`, and `sort`, among others.
 
 ### Objectives
 + Create an array called **characterClasses** and give it a few initial values
 + Change the value of the second item, and use `append` to add an item
 + Use the `insert` and `remove` methods to change the array further
 + Explore the `reverse`, `contains`, and`sort` methods
 + Create a new array called **skillTree** that stores arrays as its values, in essence a nested array list
 + Use chained **subscript syntax** to access a value in **skillTree**
 */
// Changing & appending items
var characterClasses:Array<String> = ["Ranger", "Paladin", "Druid"]
characterClasses[1]
// append only lets you append one
characterClasses.append("Gunslinger")
characterClasses += ["Healer", "Berserker"]

//Inserting and removing items
characterClasses.insert("Beast Master", at: 2)
characterClasses.remove(at: 1)

// Other methods
characterClasses.reverse()
characterClasses.contains("Gunslinger")

// Nested arrays and subscripts
// 2 dimensional array
var skillTree: [[String]] = [
    ["attack", "barrage", "heavy hitter"],
    ["guard", "evasion", "run like hell"]
]

print(skillTree[0][2])

print(characterClasses)
/*:
 [Previous Topic](@previous)
 
 [Next Topic](@next)
 */
