import UIKit

/*
 NOTES:
 - what if the user puts in 178.4.5.6?
 - try putting an info view in that explains what BMI is
 - try passing the score to the info window
 - try adding a view that does the same thing in imperial units
 - can you have two views that use the same calculation functions?
 - try doing calculations to tell the user how much weight they need to lose or to be normal weight
*/

class ViewController: UIViewController {

    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var resultField: UITextView!
    @IBOutlet weak var clearFields: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightInput.delegate = self
        heightInput.delegate = self
        clearFields.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateBmi(){
        var bmi:(score:Float, message:String)
        if weightInput.text == "" || heightInput.text == "" {
            let errorMessage:String = weightInput.text == "" ? "weight" : "height"
            let message:String = "Please enter your \(errorMessage)"
            let alert = UIAlertController(title: "No blank fields", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            let weight:String? = weightInput.text
            let height:String? = heightInput.text
            if let weight = weight,
                let height = height {
                bmi = bmiCalculator(weight: String(weight), height: String(height))
                displayMessage(score: String(bmi.score), message: bmi.message)
            }
        }
    }
    
    func displayMessage(score:String, message:String) {
        resultField.text = "Your BMI score is \(score)\n\(message)"
        clearFields.isHidden = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        weightInput.resignFirstResponder()
        heightInput.resignFirstResponder()
    }
    
    func bmiCalculator(weight:String, height: String) -> (score:Float, message:String) {
        let weight:Float? = Float(weight)
        let height:Float? = Float(height)
        var message:String? = ""
        var score:Float = 0
        
        if let weight = weight,
            let height = height {
            score = (weight / pow(height, 2)) * 703
            
            if score > 25 {
                message = "You are overweight"
            } else if score >= 18.5 && score <= 25 {
                message = "You are normal weight"
            } else {
                message = "You are under weight"
            }
        } else {
            
        }

        return (score, message!)
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        weightInput.text? = ""
        heightInput.text? = ""
        resultField.text? = ""
        clearFields.isHidden = true
    }
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
