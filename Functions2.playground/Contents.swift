import UIKit

// default values gives a default whether its there or not
// returns
func divisionDescription(forNumerator num: Double, endDenominator den: Double, withPunctuation punctuation: String = ".") -> String {
    return("\(num) divided by \(den) equals \(num / den)\(punctuation)")
}

print(divisionDescription(forNumerator: 16.0, endDenominator: 4.0))
print(divisionDescription(forNumerator: 20.0, endDenominator: 5.0, withPunctuation: "!"))

//nested functions and scope
func areaOfTriangle(widthBase base:Double, andHeight height:Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    
    return divide()
}

print(areaOfTriangle(widthBase: 3.0, andHeight: 5.0))

//multiple returns and named tuples
func sortEvensOdds(numbers:[Int]) -> (evens:[Int], odds:[Int]) {
    var evens = [Int]()
    var odds = [Int]()
    
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    
    return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let theSortedNumbers = sortEvensOdds(aBunchOfNumbers)
print("the even numbers are \(theSortedNumbers.evens), and the odd numbers are \(theSortedNumbers.odds)")
