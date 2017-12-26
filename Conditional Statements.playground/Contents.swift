import UIKit

func loveCalculator(yourName:String, theirName:String) -> (text:String, loveScore:UInt32) {
    let loveScore = arc4random_uniform(101)
    var text:String = ""
    
    if loveScore > 75 {
        text = "Your love score is \(loveScore). You love each other very much."
    } else if loveScore > 35 && loveScore <= 75 {
        text = "Your love score is \(loveScore). You love each other."
    } else {
        text = "Your love score is \(loveScore). Oh well."
    }
    
    return(text, loveScore)
}

let response = loveCalculator(yourName: "Todd", theirName: "Larry")
//print(response.loveScore)
//print(response.text)

print("\(response.loveScore). \(response.text)")
