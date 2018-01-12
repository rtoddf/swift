import Foundation
import UIKit



let json = """
    {"themes" : [
        {
            "title": "Foo",
            "answer": 1,
            "question": 2
        },
        {
            "title": "Bar",
            "answer": 3,
            "question": 4
        }
    ]}
  """.data(using: String.Encoding.utf8)!

struct Theme: Decodable {
    var themes:[Question]
}

struct Question: Decodable {
    var title:String
    var answer:Int
    var question:Int
}

var articles:[Question] = []

if let decoded = try? JSONDecoder().decode(Theme.self, from: json) {
    print("decoded: ", decoded)
    
    for question in decoded.themes {
        var s = Question(title: question.title, answer: question.answer, question: question.question)
        articles.append(s)
    }
    
    print("articles: ", articles)
    
    for article in articles {
        print(article.title)
    }
} else {
    print("error")
}
