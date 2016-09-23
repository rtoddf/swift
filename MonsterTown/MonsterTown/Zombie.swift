import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    
    override func terrorizeTown() {
        town?.changePopulation(amount: -10)
        // using super will call the superclass's method after the override
        super.terrorizeTown()
    }
    
    func changeName(name:String, walksWithLimp:Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}
