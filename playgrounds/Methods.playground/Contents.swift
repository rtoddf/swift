import UIKit

var str = "Hello, playground"

// more complex methods
class Person {
    var Name: String
    var Age: Int
    
    init(){
        Name = "initial name"
        Age = 10
    }
    
    // class/type method
    class func ageAverage() -> Int {
        return 36
    }
    
    // instance methods - done on objects
    func updateNameAndAge(nameToSet:String, agetoSet:Int){
        self.Name = nameToSet
        self.Age = agetoSet
    }
    
    func increaseAge(ageToIncreaseBy: Int) -> Int {
        self.Age += ageToIncreaseBy
        return self.Age
    }
}

var personA = Person()

personA.updateNameAndAge("Bob", agetoSet: 20)

personA.Name
personA.Age

personA.increaseAge(20)

// call a class method
Person.ageAverage()


