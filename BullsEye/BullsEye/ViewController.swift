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
        startOver()
        
        // image literals
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
//        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
//        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackImageLeft = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackImageLeft.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackImageRight = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackImageRight.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
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
    
    @IBAction func startOver(){
        points = 0
        score = 0
        round = 0
        
        startNewRound()
    }

    @IBAction func showAlert() {
        let difference:Int = abs(currentValue - targetValue)
        points = 100 - difference

        let title:String
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "Sooooo close!"
            if difference == 1 { points += 50 }
        } else if difference < 10 {
            title  = "Pretty good...."
        } else {
            title = "Please try again"
        }
        
        score += points

        let message:String = "Your score is \(score)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // swift closure in the handler
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
                self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    } 
}

//global scope
//instance scope
//local scope - duration of the method

