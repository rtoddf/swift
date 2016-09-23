import Foundation

var myTown = Town()

myTown.changePopulation(amount: 200)

/*
myTown.printTownDesription()
let gm = Monster()
gm.town = myTown
gm.terrorizeTown()
*/

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDesription()
fredTheZombie.changeName(name: "Fred the Zombie", walksWithLimp: false)

