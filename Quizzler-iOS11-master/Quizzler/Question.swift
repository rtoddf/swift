import Foundation
// Foundation is lighter weight than UIKit

// a class is a blueprint - not the object itself
// objects have properties
// objects have actions (functions)
// objects have events - how it reacts

class Question {

    let questionText:String
    let answer:Bool
    
    // what happens when a new question is created
    init(text:String, correctAnswer:Bool) {
        questionText = text
        answer = correctAnswer
    }

}
