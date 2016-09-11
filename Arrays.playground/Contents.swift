import UIKit

//var bucketList: Array<String>
//var bucketList: [String] = ["climb mt. everest"]

var bucketList = ["climb mt. everest"]
//bucketList.append("fly hot air balloon")
//bucketList.append("watch the lord of the rings trilogy")
//bucketList.append("go on a walkabout")
//bucketList.append("Scuba dive")
//bucketList.append("find a triple rainbow")

var newItems = [
    "climb mt. everest",
    "fly hot air balloon",
    "watch the lord of the rings trilogy",
    "go on a walkabout",
    "Scuba dive",
    "find a triple rainbow"
]

//for item in newItems {
//    bucketList.append(item)
//}

bucketList += newItems

bucketList

bucketList.removeAtIndex(2)

bucketList

bucketList.count

bucketList[0...2]

bucketList[2] += " in Australia"

bucketList

bucketList.insert("Toboggan across Alaska", atIndex: 2)

var myronsList = [
    "climb mt. everest",
    "fly hot air balloon",
    "watch the lord of the rings trilogy",
    "go on a walkabout",
    "Scuba dive",
    "find a triple rainbow",
    "climb mt. everest"
]

let equal = (bucketList == myronsList)

let lunches = [
    "Cheeseburger",
    "Veggie pizza",
    "Chicken Ceasar Salad",
    "Black bean burrito",
    "Falafel wrap"
]

lunches.isEmpty


