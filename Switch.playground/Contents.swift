import UIKit

var statusCode:Int = 420
var errorString:String = "The request failed with the error: "

switch statusCode {
//case 400:
//    errorString = "Bad request"
//case 401:
//    errorString = "Unauthorized"
//case 403:
//    errorString = "Forbidden"
//case 404:
//    errorString = "Not Found"
//default:
//    errorString = "none"
    
//case 400, 401, 403, 404:
//    errorString += "There was something wrong with the request. "
//    fallthrough
    // fallthrough is a control transfer statement
    
//default:
//    errorString += "Please review the request and try again"
    
case 100, 101:
    errorString += "Informational, \(statusCode)."
case 204:
    errorString += "Successful, but no content, \(statusCode)."
case 300...307:
    errorString += "Redirection, \(statusCode)."
case 400...417:
    errorString += "Client error, \(statusCode)."
case 500...505:
    errorString += "Server error, \(statusCode)."
//default:
//    errorString += "Unknown. Please review the request and try again."

case let unknownCode:
    errorString += "\(unknownCode) is not a known error code."
}

let error = (code: statusCode, error: errorString)

error.0
error.1

error.code
error.error



//ranges
