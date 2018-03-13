//: Playground - noun: a place where people can play

import UIKit

var html = "<style>p{margin:0}</style>"
html.append("<p>Hello, world!</p><p>Hello, world!</p>")

//let html = """
//<p>Hello, world!</p>
//<p>Hello, world!</p>
//"""


let data = Data(html.utf8)

let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))


if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
    textView.attributedText = attributedString
}
