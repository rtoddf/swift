import Foundation

class DateCalculator {
    var hisAge: Float = 0
    var hisName : String?
    
    init(){
        
    }
    
    func shouldHeDateIfHisAgeIs(manAge: Float) -> Bool {
        let minAgeToDate = manAge / 2 + 7
        return manAge > minAgeToDate
    }
}