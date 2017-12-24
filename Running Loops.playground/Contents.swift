import UIKit

let arrayOfNumbers = [1, 5, 3, 6, 2, 7, 23, 34]

func getTotal() -> Int {
    var sum:Int = 0
    for number in arrayOfNumbers {
        sum += number
    }
    
    return sum
}

print(getTotal())

for number in 1...10 {
    print(number)
}

for number in 1...10 where number % 2 == 0 {
    print(number)
}

for number in 1...10 where number % 2 != 0 {
    print(number)
}

for number in 1..<10 {
    print(number)
}
