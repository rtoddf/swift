import UIKit

var myFirstInt:Int = 0

for i in 1...5 {
    ++myFirstInt
//    print(myFirstInt)
    print("my first int is \(myFirstInt) at iteration \(i)")
}


for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

for var i = 1; i < 6; i++ {
    print(i)
}

// control transfer statements
var shields:Int = 5
var blastersOverheating:Bool = false
var blasterFireCount:Int = 0
var spaceDemonsDestroyed:Int = 0

while shields > 0 {
    if spaceDemonsDestroyed == 500 {
        print("You beat the game!")
        break
    }
    
    if blastersOverheating {
        print("Blasters are overheated! Cooldown initiated.")
        sleep(5)
        print("Blasters are ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    //fire blasters!!
    print("Fire blasters")
    
    ++blasterFireCount
    ++spaceDemonsDestroyed
}