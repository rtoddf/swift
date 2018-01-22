import UIKit

class AppCategory:NSObject {
    var name:String?
    var apps: [App]?
    
    static func sampleAppCategories() -> [AppCategory] {
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        var bestNewApps = [App]()

        let firstApp = App()
        firstApp.name = "Xavier Dolan"
        firstApp.category = "Actor/Director"
        firstApp.imageName = "xavier-dolan"
        firstApp.price = 3.99
        bestNewApps.append(firstApp)
        bestNewAppsCategory.apps = bestNewApps
        
        
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best New Games"
        var bestNewGamesApps = [App]()
        
        let secondApp = App()
        secondApp.name = "Andrew Garfield"
        secondApp.category = "Actor"
        secondApp.imageName = "andrew-garfield"
        secondApp.price = 7.99
        bestNewGamesApps.append(secondApp)
        bestNewGamesCategory.apps = bestNewGamesApps
        
        return [bestNewAppsCategory, bestNewGamesCategory]
    }
}

class App:NSObject {
    var id:NSNumber?
    var name:String?
    var category:String?
    var imageName:String?
    var price:NSNumber?
}
