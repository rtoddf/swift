import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var questionNumber:Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[questionNumber]
        questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
//        pickedAnswer = sender.tag == 1 ? true : false
        checkAnswer(sender.tag == 1 ? true : false)
        questionNumber += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if questionNumber <= allQuestions.list.count {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            print("end of game")
        }
    }
    
    
    func checkAnswer(_ pickedAnswer:Bool) {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if pickedAnswer == correctAnswer {
            print("correct")
        } else {
            print("incorrect")
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
