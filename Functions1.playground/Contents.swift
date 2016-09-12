import UIKit

func printGreeting() {
    print("Hell there")
}

printGreeting()

func printPersonalGreeting(name: String) {
    print("Hello \(name), how are you?")
}

printPersonalGreeting("Jim")

//func divisionDescription(num: Double, den:Double){
//    print("\(num) divided by \(den) equals \(num / den)")
//}
//
//divisionDescription(9.0, den: 3.0)
//

//function below is called divisionDescription(forNumerator:andDenominator:)

func divisionDescription(forNumerator num: Double, endDenominator den: Double) {
    print("\(num) divided by \(den) equals \(num / den)")
}

divisionDescription(forNumerator: 12.0, endDenominator: 4.0)

// variadic parameters

func printPersonalGreetings(names: String...) {
    for name in names {
        print("Hello \(name), how are you?")
    }
}

printPersonalGreetings("Jim", "Mark", "Sam", "Larry")
