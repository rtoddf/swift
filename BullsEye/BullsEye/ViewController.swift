import UIKit

class ViewController: UIViewController {
    var currentValue:Int = 0
    var targetValue:Int = 0
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetValueDisplay:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }
    
    func updateLabels() {
        targetValueDisplay?.text = String(targetValue)
    }
    
    func startNewRound() {
        targetValue = Int(arc4random_uniform(101))
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderMoved(_ slider:UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        let message:String = "The value of the slider is: \(currentValue)\n" + "The target value is \(targetValue)"
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    } 
}

//global scope
//instance scope
//local scope - duration of the method

