import UIKit

func fibonacci(until n:Int) {
    var num1:Int = 0
    var num2:Int = 1
    
    for _ in 0...n {
        let num = num1 + num2
        
        if num % 2 == 0{
            print(num)
        }
        
        num1 = num2
        num2 = num
    }
}

fibonacci(until: 10)
