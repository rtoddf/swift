import UIKit

var str = "Hello, playground"

// Classes
class Person {
    
    // properties go first
    // all properties must have initial values
    //
    var Name: String = "initial name"
    
    // all classes must be initialized
    // executed when a new object is created
    init(){
        println("New person initialized")
        
        // self is - call a message that you own - your-self
        self.sayCheese()
    }
    
    // methods
    func sayCheese(){
        println("Cheese")
    }
}

var person_a = Person()
// call the method on the object
//person_a.sayCheese()

// accessing properties
person_a.Name

// change the property
person_a.Name = "Alice"

// create a second Person instance
var person_b = Person()
person_b.Name = "bob"
person_b.Name
