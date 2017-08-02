//  CivicsQuiz1

//https://www.youtube.com/watch?annotation_id=annotation_4161981239&feature=iv&src_vid=nvug6a_jPRs&v=dyxqsfrCaeM

import UIKit

struct Question {
    var Question: String!
    var Answers: [String]!
    var Answer: Int!
}

class ViewController: UIViewController {
    
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    var Questions = [Question]()
    var QNumber = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Questions = [Question(Question: "How many US senators are there?", Answers: ["100", "400", "150", "75"], Answer: 0)]
        
        PickQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func PickQuestion(){
        if Questions.count > 0 {
            
            
//            for i in 0...Buttons.count - 2 {
//                print("whhoppe \(Buttons.count)")
//            }
            QNumber = 0
            QLabel.text = Questions[QNumber].Question
            
            for i in 0...Buttons.count - 2 {
                Buttons[i].setTitle(Questions[QNumber].Answers[i], forState: UIControlState.Normal)
//                Buttons[i].setTitle(Questions[QNumber].Answers[i], forState: UIControlState.Normal)
            }
            
            Questions.removeAtIndex(QNumber)
        } else {
            print("no more")
        }
    }


}

