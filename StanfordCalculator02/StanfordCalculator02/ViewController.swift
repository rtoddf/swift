import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        // println("the number selected was \(digit)")
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
//    var operandStack: Array<Double> = Array<Double>()
    // same as below because the type can be inferrred
    var operandStack = Array<Double>()
    
    
    @IBAction func multiply(sender: UIButton) {
        let operation = sender.currentTitle!
//        if userIsInTheMiddleOfTypingANumber {
//            enter()
//        }
        
        switch operation {
            case "×":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() * operandStack.removeLast()
                    enter()
                }
//            case "÷":
//            case "+":
//            case "-":
            default: break
        }
    }
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
    }
    
    var displayValue:Double {
        get {
            // look up NSNumberFormatter()
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            // evaluates an expresssin - \()
            // look up newValue
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    
}

