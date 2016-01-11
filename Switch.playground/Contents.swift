import UIKit

var statusCode:Int = 404
var errorString:String

switch statusCode {
case 400:
    errorString = "bad request"
    
case 401:
    errorString = "Unauthorized"
    
case 403:
    errorString = "Forbidden"
    
case 404:
    errorString = "Not found"
    
default:
    errorString = "none"
}

print("\(errorString)")

// control transfer statement - fallthrough
var errorString02:String = "The request failed with the error:"

switch statusCode {

case 400, 401, 403, 404:
    errorString02 += " There was something wrong with the request."
    fallthrough
    
default:
    errorString02 += " Please review the request and try again."
    // because of the fallthrough, the default will execute regardless
}

print("\(errorString02)")

// switch statements in most languages automatically fall through their cases. These languages require a break control transfer statement at the and of hte case's code to break out of hte switch. Swift's code works in the opposite manner. If you match on a case, then the case executes its cde and hte squtch stops running.

// FINISH UP CHAPTER 5's examples!!