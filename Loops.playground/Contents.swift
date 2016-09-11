import UIKit

var myFirstInt = 0

//for i in 1...5 {
for _ in 1...5 {
    myFirstInt += 1
//    print("myFirstInt equals \(myFirstInt) at iteration \(i)")
    
    print(myFirstInt)
}

for var i = 1; i < 6; ++i {
    ++myFirstInt
    print(myFirstInt)
}