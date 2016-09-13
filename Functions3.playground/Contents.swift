import UIKit

// optional return types
func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(("matt", nil, "someone"))

if let theName = middleName {
    print(theName)
}

// exit early from a function - use guard (pg. 226)

