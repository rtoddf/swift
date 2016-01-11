import UIKit

let playground:String = "Hello, playground"
var mutablePlayground:String = "Hello mutable playground"

mutablePlayground += "!"

//for c in mutablePlayground.characters {
//    print("\(c)")
//}

// UNICODE
/*
At their heart, strings in Swift are composed of unicode scalars. Unicode scalars are 21-bit numbers that represent a specific character int he unicode standard. 

For example, U+0061 represents the Latin small letter "a". U+1F60E represents the smiley-faced emoji with sunglasses. The 1F60E portion is a number written in hexidecimal.
*/

//Using the Unicode scalar
let oneCoolDude = "\u{1F60E}"

// Using the combining scalar
/*
Every character in Swift is built up from one or more Unicode scalars. One unicode scalar maps onto one fundamental character of a given language. U+0301 represents the unicode scalar for the combining acute accent. This scalar is placed on top of (combined with) the character that precedes it. You can use it with the small letter a.
*/

let aAcute = "\u{0061}\u{0301}"

for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}

/*
This is will output a bunch of numbers. Each number corresponds to a Unicode scalar representing a single character in the string. They are NOT Hexidecimal numbers. Instead, each is represented as an unsigned 32-bit integer. The first, 72, corresponds to the Unicode scalar value of U+0048, or an uppercase "H".
*/

/*
Canonical equivalence
While there is a role for combining scalars, Unicode also povides already-combined forms for some characters like the accented a.

Canonical equivalence refers to whether two sequences of Unicode scalars are the same linguistically. They are considered equal fit hey have the same liguistic meaning and appearance, regardless of whether they are built from the same Unicode scalars.
*/

let aAcutePrecomposed = "\u{00E1}"

let b = (aAcute == aAcutePrecomposed)

