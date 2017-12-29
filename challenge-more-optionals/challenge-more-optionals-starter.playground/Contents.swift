
/*:
 ### MORE OPTIONALS
 
 Using your `myFavoriteSong` variable from the previous challenge, use optional binding to check if it contains a value. If it does, print out the value. If it doesn’t, print "I don’t have a favorite song."
 */

// TODO: Write solution here
var myFavoriteSong:String? = "Penny Lane"
if let myFavoriteSong = myFavoriteSong {
    print("My favorite song is \(myFavoriteSong).")
} else {
    print("I don't have a favorite song.")
}
/*:
 Change `myFavoriteSong` to the opposite of what it is now. If it’s nil, set it to a string; if it’s a string, set it to nil. Observe how your printed result changes.
 */

// TODO: Follow instructions

/*:
 Write a function called `printNickname` that takes an optional String as a parameter. Use the `guard` statement to try to unwrap the nickname, and if it fails print an error and return. Otherwise, print the unwrapped nickname.
 */

// TODO: Write solution here
func printNickname(_ knick:String?) {
    guard let knick = knick else {
        print("Error")
        return
    }
    print("my knickname is \(knick)")
}

printNickname("honey man")
