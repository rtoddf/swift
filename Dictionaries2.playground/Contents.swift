//: Playground - noun: a place where people can play

import UIKit

var georgia = ["Cobb": [Int](),
               "Dekalb": [Int](),
               "Fulton": [Int]()
]

georgia["Cobb"] = [30311,30312,30313,30314,30315]
georgia["Dekalb"] = [30306,30307,30308,30309,30310]
georgia["Fulton"] = [30311,30312,30313,30314,30315]

georgia


var zipCodes = [Int]()

for state in georgia.values {
    for zip in state {
//        print(zip)
        if !zipCodes.contains(zip) {
            zipCodes.append(zip)
        }
    }
}

zipCodes = zipCodes.sort{$0 < $1}
print(zipCodes)