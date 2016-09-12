import UIKit

// default values gives a default whether its there or not

func divisionDescription(forNumerator num: Double, endDenominator den: Double, withPunctuation punctuation: String = ".") -> String {
    return("\(num) divided by \(den) equals \(num / den)\(punctuation)")
}

print(divisionDescription(forNumerator: 16.0, endDenominator: 4.0))
print(divisionDescription(forNumerator: 20.0, endDenominator: 5.0, withPunctuation: "!"))

