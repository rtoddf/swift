import Foundation

struct Town {
    var population = 5422
    var numberOfStoplights = 4
    
    func printTownDesription(){
        print("Population: \(population), number of stoplights: \(numberOfStoplights)")
    }
    
    //this method changed the object itself - thus it must be marked as mutating
    mutating func changePopulation(amount: Int){
        population += amount
    }
}

