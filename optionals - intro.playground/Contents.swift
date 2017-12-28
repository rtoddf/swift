import UIKit

var result:Int? = 30
print(result)

var authorName:String? = "Stepen King"
//var authorName:String? = nil
var authorAge:Int? = 62
//var authorAge:Int? = nil

// force umwrapping is never a good idea - what if it's nil?
//var authorNameUnwrapped = authorName!

// optional binding
// you can do multiple values
if let authorName = authorName,
    let authorAge = authorAge {
    print("Author name is \(authorName) and he is \(authorAge)")
} else {
    print("No author or age")
}


// you can also use guard - check the examples downloaded - more-optionals
// optionalInt -
// check the video on this a few times #76
