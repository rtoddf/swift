import UIKit

class ViewController: UIViewController {
    // IBOutlets are properties - they go at hte top
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playRoundButton.setTitle("Play", forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // IBActions are methods
    @IBAction func playRoundTapped(sender: UIButton) {
        self.firstCardImageView.image = UIImage(named: "card2")
        self.secondCardImageView.image = UIImage(named: "card9")
    }
}

// next is #12 - random number

