import UIKit

class ViewController: UIViewController {
    var currentValue:Int = 0
    var targetValue:Int = 0
    var points = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetValueDisplay:UILabel?
    @IBOutlet weak var scoreDisplay:UILabel?
    @IBOutlet weak var roundDisplay:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }
    
    func updateLabels() {
        targetValueDisplay?.text = String(targetValue)
        scoreDisplay?.text = String(score)
        roundDisplay?.text = String(round)
    }
    
    func startNewRound() {
        targetValue = Int(arc4random_uniform(101))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderMoved(_ slider:UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        let difference:Int = abs(currentValue - targetValue)
        points = 100 - difference
        score += points

        let message:String = "The value of the slider is: \(currentValue)\n" + "The target value is \(targetValue). Your points are \(points)"
        
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

