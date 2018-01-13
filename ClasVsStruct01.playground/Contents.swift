import UIKit
// reference type - done by reference, not copies - classes
// value type - passed around by copies - structs

class Macbook {
    var year:Int
    var color:String
    
    init(year:Int, color:String) {
        self.year = year
        self.color = color
    }
}

let myMacbook = Macbook(year: 2016, color: "Space grey")
let stolenMacbook = myMacbook
stolenMacbook.color = "green"
print(myMacbook.color)

struct iPhone {
    var number:Int
    var color:String
}

let myIphone = iPhone(number: 6, color: "black")
// creates a copy
var stolenIphone = myIphone
stolenIphone.color = "rose"
print(myIphone.color)


// classes have inheritance, structs do not
// structs are lightweight and clean
