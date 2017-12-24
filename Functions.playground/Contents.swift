import UIKit

// create the getMilk() function
func getMilk(howManyMilkCartons:Int, howMuchMoneyGiven:Int) -> Int {
    let pricePerCartonMilk:Int = 3
    let priceToPay:Int = howManyMilkCartons * pricePerCartonMilk
    
    print("go to the shops")
    print("buy \(howManyMilkCartons) cartons of milk")
    print("pay \(priceToPay) dollars")
    print("come home")
    
    let change = howMuchMoneyGiven - priceToPay
    
    return change
}

// call the getMilk() function
var amountOfChange:Int = getMilk(howManyMilkCartons: 3, howMuchMoneyGiven: 12)

print("\(amountOfChange)")
