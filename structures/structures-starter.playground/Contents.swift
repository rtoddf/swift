import Foundation

struct Location {
    let x:Int
    let y:Int
}

struct DeliveryArea {
    let center:Location
    let radius:Double
    
    func contains(_ location:Location) -> Bool {
        let distanceToStore = distance(from: location, to: self.center)
        return distanceToStore < self.radius
    }
}

let restaurant = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
let otherRestaurant = DeliveryArea(center: Location(x: 7, y: 8), radius: 1.5)

let restaurants = [restaurant, otherRestaurant]

// Pythagorean Theorem 📐🎓
func distance(from source: Location, to target: Location) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return sqrt(distanceX * distanceX + distanceY * distanceY)
}

func isInDeliveryRange(location: Location) -> Bool {
    for restaurant in restaurants {
        if restaurant.contains(location) {
            return true
        }
    }
    return false
}

isInDeliveryRange(location: Location(x: 3, y: 4))
isInDeliveryRange(location: Location(x: 5, y: 4))
isInDeliveryRange(location: Location(x: 8, y: 8))
