import Foundation

var myTown = Town()


myTown.changePopulation(10000)

let ts = myTown.townSize
print(ts)

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
fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)

print("victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("victim pool: \(fredTheZombie.victimPool), population: \(fredTheZombie.town?.population)")