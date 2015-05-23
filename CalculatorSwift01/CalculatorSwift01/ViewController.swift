import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleOfTypingANumber: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        // using let because its a constant
        // not going to change
        // has to be unwrapped with !
        let digit = sender.currentTitle!
        if userInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userInTheMiddleOfTypingANumber = true
        }
        
        // evaluates an expresssin - \()
//        println("digit = \(digit)")
    }
    
    // internal stack
    // long way
    // var operandStack: Array<Double> = Array<Double>()

    // short way - infers the type
    var operandStack = Array<Double>()
    
    // operations
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userInTheMiddleOfTypingANumber {
            // automatic enter
            enter()
        }
        switch operation {
            // long way
            /*
            * it is so common to pass functions as args,
            you can put a function right in the arg pass
            
            * curly STARTS at the beginning, and where is WAS, put "in"
            
            * this is closure
            */
            
            // case "×": performOperation({(op1: Double, op2: Double) -> Double in
            //      return op1 * op2
            // })

            /* 
                * more succinct - no need for types - inferred
                
                * the performOperation knows there is a return - no need for return

                * swift does not require you to name vars - if you don't,
                    they will be renamed to $0 and $1

                * if the function you are moving to, this is th de last arg, you
                    can move the function being passed outside the parens

                * if its the only arg, you can remove the parens
            */
            
            case "×": performOperation { $0 * $1 }
            case "÷": performOperation { $1 / $0 }
            case "+": performOperation { $0 + $1 }
            case "-": performOperation { $1 * $0 }
            case "√": performOperationOne { sqrt($0) }
            default: break
        }
    }
    
    // pass a function as the arg
    // this particular one gets two Doubles and returns a double
    func performOperation(operation: (Double, Double) -> Double){
        // need at least two doubles to multiply
        // error if the array is not greater than 0
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            // automatic enter
            enter()
        }
    }
    
    // why couldn't you name this the same?
    func performOperationOne(operation: Double -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    // if you were to write a function for multiply
//    func multiply(op1: Double, op2: Double) -> Double {
//        return op1 * op2
//    }
    
    @IBAction func enter() {
        userInTheMiddleOfTypingANumber = false
        
        // have to convert string to double
        operandStack.append(displayValue)
        
        println("operandStack = \(operandStack)")
    }
    
    // gets or sets a string as a double
    var displayValue: Double {
        get {
            // look up NSNumberFormatter()
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            // evaluates an expresssin - \()
            // look up newValue
            display.text = "\(newValue)"
            userInTheMiddleOfTypingANumber = false
        }
    }
}

