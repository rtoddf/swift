import UIKit

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

func sortAscending(i:Int, j:Int) -> Bool {
    return i < j
}

//let volunteersSorted = volunteerCounts.sort(sortAscending)

//let volunteersSorted = volunteerCounts.sort({
//    (i:Int, j:Int) -> Bool in
//        return i < j
//})

// types inferred
//let volunteersSorted = volunteerCounts.sort({ (i, j) in i < j })

//let volunteersSorted = volunteerCounts.sort({ $0 < $1 })

let volunteersSorted = volunteerCounts.sort { $0 < $1 }

print(volunteersSorted)

//functions as return types

func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd:Int, toLights:Int) -> Int {
        return toLights + lightsToAdd
    }
    return buildRoads
}

var stopLights = 4
let townPlan = makeTownGrand()
stopLights = townPlan(4, stopLights)

print("\(stopLights)")
