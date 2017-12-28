import UIKit

let coordinates: (Int, Int) = (2, 3)
let coordinatesDouble: (Double, Double) = (2.3, 3.5)
let coorMixed: (Double, Int) = (2.5, 5)

let x1 = coordinates.0
let y1 = coordinates.1

let coorNamed = (x: 2, y: 3)
let x2 = coorNamed.x
let y2 = coorNamed.y

let coor3D = (x: 2, y: 3, z: 4)
let (x3, y3, z3) = coor3D
x3
y3
z3

let (x4, y4, _) = coor3D
x4
y4
