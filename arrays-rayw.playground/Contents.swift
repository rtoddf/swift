import UIKit

// ordered list of elements
// elements of the same type

// Creating arrays
// four ways to initialize an array
var emptyArray1:Array<String> = []
var emptyArray4: [String] = []
var emptyArray2 = Array<String>()
var emptyArray3 = [String]()


var evenNumbers:[Int] = [22, 4, 6, 8]
evenNumbers.append(10)
evenNumbers += [12]
evenNumbers.isEmpty
evenNumbers.count

// first item in the array
if let first = evenNumbers.first {
    print(first)
} else {
    print("the first val is nil")
}

// min() returns the min value in the array
if let min = evenNumbers.min() {
    print(min)
} else {
    print("there is no min value")
}

let firstThree = evenNumbers[0...2]
evenNumbers.contains(3)
evenNumbers.removeLast()

evenNumbers.swapAt(0, 2)

for evenNumber in evenNumbers {
    print("the number is \(evenNumber)")
}

for (index, evenNumber) in evenNumbers.enumerated() {
    print("\(index) is \(evenNumber)")
}

// .dropFirst(3) or .dropLast or .prefix(3) or .suffix(1)

