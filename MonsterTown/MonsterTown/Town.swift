import Foundation

struct Town {
    let region = "South"
    var population = 5422
    var numberOfStoplights = 4
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    
//    lazy var townSize: Size = {
    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }
        }
    }
//    ()
    
    func printTownDesription(){
        print("Population: \(population), number of stoplights: \(numberOfStoplights)")
    }
    
    //this method changed the object itself - thus it must be marked as mutating
    mutating func changePopulation(amount: Int){
        population += amount
    }
}

