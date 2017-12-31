import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var resultField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightInput.delegate = self
        heightInput.delegate = self
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
            bmi = bmiCalculator(weight: Float(weightInput.text!)!, height: Float(heightInput.text!)!)
            resultField.text = "Your BMI score is \(String(bmi.score))\n\(bmi.message)"
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        weightInput.resignFirstResponder()
        heightInput.resignFirstResponder()
    }
    
    func bmiCalculator(weight:Float, height: Float) -> (score:Float, message:String) {
        let score:Float = (weight / pow(height, 2)) * 703
        var message:String = ""
        
        if score > 25 {
            message = "You are overweight"
        } else if score >= 18.5 && score <= 25 {
            message = "You are normal weight"
        } else {
            message = "You are under weight"
        }
        
        return (score, message)
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
