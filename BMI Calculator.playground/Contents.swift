import UIKit

// 1 foot = 12 inches
// 1 inch  = 0.0254 metres
// 1 pound = 0.45359237 kilograms

func convertHeightToImperialUnits(weightInPounds:Float, heightInFeet:Float, remainingInches: Float) -> (weightInKg:Float, heightInMeters:Float){
    let weightInKg:Float = weightInPounds * 0.45359237
    let heightInMeters:Float = ((heightInFeet * 12) + remainingInches) * 0.0254
    
    return (weightInKg, heightInMeters)
}

func bmiCalculator(weight:Float, height:Float) -> (score:Float, message:String) {
    let score:Float = (weight / pow(height, 2))
//    let score:Float = (weight / pow(height, 2)) * 703
//    let score:Float = (weight / (height * height)) * 703
    var message:String = ""

    if score > 25 {
        message = "You are overweight"
    } else if score >= 18.5 && score <= 25 {
        message = "You are normal weight"
    } else {
        message = "You are under weight"
    }
    
    return (score, message)
//    return (round(score), message)
}

let weightInPounds:Float = 178.4
let heightInFeet:Float = 5
let heightInInches:Float = 11.5

let imperialUnits = convertHeightToImperialUnits(weightInPounds: weightInPounds, heightInFeet: heightInFeet, remainingInches: heightInInches)
let bmi = bmiCalculator(weight: imperialUnits.weightInKg, height: imperialUnits.heightInMeters)
print("Your weight in kilograms is \(imperialUnits.weightInKg), and your height in meters is \(imperialUnits.heightInMeters). With a weight of \(weightInPounds) pounds and a height of \(heightInFeet * 12 + heightInInches) inches, your BMI score is \(String(format: "%.2f", bmi.score)). \(bmi.message).")
