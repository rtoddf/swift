import UIKit

func beerSong(forThisManyBottles numberOfBottles:Int) -> String {
    var lyrics:String = ""
    
    for number in (1..<numberOfBottles).reversed() {
        var startingBottles:String = number != 1 ? String(number) + " bottles" : String(number) + " bottle"
        var remainingBottles:String = (number-1) != 0 ? String(number - 1) : "no more"
        lyrics += "\(startingBottles) of beer on the wall, \(startingBottles) of beer. Take one down and pass it around, \(remainingBottles) bottles of beer on the wall. \n"
    }
    
    lyrics += "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall."
    
    return lyrics
}

print(beerSong(forThisManyBottles: 100))
