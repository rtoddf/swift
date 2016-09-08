import UIKit

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0

while shields > 0 {
    if spaceDemonsDestroyed == 500 {
        print("you beat my game!")
        break
    }
    
    if blastersOverheating {
        print("blasters are overheated! cooldown initiated")
        sleep(5)
        print("blasters are ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
        continue
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    // fire blasters
//    print("fire blasters!")
//    blasterFireCount += 1
//    spaceDemonsDestroyed += 1
}
