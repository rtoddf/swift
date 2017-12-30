import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
//        pickedAnswer = sender.tag == 1 ? true : false
        checkAnswer(sender.tag == 1 ? true : false)
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer(_ pickedAnswer:Bool) {
        let correctAnswer = allQuestions.list[0].answer
        
        if pickedAnswer == correctAnswer {
            print("correct")
        } else {
            print("incorrect")
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
