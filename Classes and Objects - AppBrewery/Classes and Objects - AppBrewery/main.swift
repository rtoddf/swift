import Foundation

let myCar = Car(customerChosenColor: "red")

//print(myCar.color)
//print(myCar.numberOfSeats)
//print(myCar.typeOfCar)

let myOtherCar = Car(customerChosenColor: "blue")

myCar.drive()

//print(myOtherCar.color)
//print(myOtherCar.numberOfSeats)
//print(myOtherCar.typeOfCar)

let mySelfDrivingCar = SelfDrivingCar()

print(mySelfDrivingCar.color)
print(mySelfDrivingCar.numberOfSeats)
print(mySelfDrivingCar.typeOfCar)
mySelfDrivingCar.drive()
