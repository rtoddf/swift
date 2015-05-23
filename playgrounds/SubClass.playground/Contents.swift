import UIKit

var str = "Hello, playground"

class Person {
    // declare a property
    var Name:String = "initial name"
    
    init(){
        
    }
    
    func walk(){
        println("I am walking")
    }
}

var a = Person()
a.Name = "Alice"
a.walk()

// use colon and the superclass name to subclass
class Superhero: Person {
    var AlterEgoName: String = "Kent"
    
    // override the init
    override init(){
        // custom initializers
        
        // if you try to access the properties and methods from the superclass, you'll get an error
        // you'll have to call super.init() first
        super.init()
    }
    
    func fly(){
        // you can override AND use the superclass's method too
        super.walk()
        
        println("I am flying")
    }
    
    //override walk() from parent class (superclass)
    override func walk() {
        println("I am walking faster")
    }
}

var b = Superhero()
b.Name = "Clark"
b.AlterEgoName
b.walk()
b.fly()

// Apple's UIKit docs:
// https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKit_Framework/
