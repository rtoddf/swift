import Foundation

var colorArray = ["red", "green", "green", "black", "blue", "yellow", "red", "green", "yellow", "red", "red", "green", "green", "grey", "purple", "orange", "grey", "blue", "red", "green", "yellow", "orange", "purple", "black", "red", "blue", "green", "orange", "blue", "white", "yellow", "blue", "red", "green", "orange", "purple", "blue", "black"]

// create a dictionary iwht key and value - color: 1 incrementing each time there's a new one

func getMostCommonElement(array:[String]) -> [String] {
    
    var topElements:[String] = []
    var elementDictionary:[String:Int] = [:]
    
    for color in array {
        if let count = elementDictionary[color] {
            elementDictionary[color] = count + 1
        } else {
            elementDictionary[color] = 1
        }
    }
    
    // find colors with highest values
    let highestValue = elementDictionary.values.max()
    
    for (key, value) in elementDictionary {
        if elementDictionary[key] == highestValue {
            topElements.append(key)
        }
    }
    
    return topElements
}

getMostCommonElement(array: colorArray)
