import UIKit

// methods on enums
enum LightBulb {
    case On
    case Off

    func surfaceTemperatureForAmbientTemperature (ambient:Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    // if you are going to modify self, you have to add mutating
    mutating func toggle(){
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

var bulb = LightBulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
// var bulbTemperature = LightBulb.On.surfaceTemperatureForAmbientTemperature(ambientTemperature)

bulb.toggle()
bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
