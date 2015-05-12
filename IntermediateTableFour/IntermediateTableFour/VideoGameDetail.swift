import Foundation
import UIKit


// per http://www.developerdave.co.uk/2014/10/gradient-backgrounds-swift/
extension CAGradientLayer {
    
    func turquoiseColor() -> CAGradientLayer {
        let topColor = UIColor(red: (15/255.0), green: (118/255.0), blue: (128/255.0), alpha: 1)
        let bottomColor = UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1)
        
        let gradientColors: Array <AnyObject> = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: Array <AnyObject> = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
}

class VideoGameDetail: UIViewController {
//    var gameTitleText = String()
//    var characterText = String()
//    var imageText = String()
//    var descriptionText = String()
    
    var game : VideoGame?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor()
        
//        let background = CAGradientLayer().turquoiseColor()
//        background.frame = self.view.bounds
//        self.view.layer.insertSublayer(background, atIndex: 0)
        
        let myGradientLayer: CAGradientLayer
        myGradientLayer = CAGradientLayer()
        myGradientLayer.startPoint = CGPoint(x: 0, y: 0)
        myGradientLayer.endPoint = CGPoint(x: 1, y: 1)
        let colors: [CGColorRef] = [
            UIColor.clearColor().CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor,
            UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor,
            UIColor.clearColor().CGColor ]
        myGradientLayer.colors = colors
        myGradientLayer.opaque = false
        myGradientLayer.locations = [0.0,  0.3, 0.5, 0.7, 1.0]
        self.view.layer.addSublayer(myGradientLayer)
        
        var imageHeight = view.bounds.size.width * 0.66
        
        var leadImageView = UIImageView(frame: CGRectMake(0, 65, view.bounds.size.width, imageHeight))
        var image = UIImage(named: game!.leadImage)
        
        leadImageView.image = image
        
        var title = UILabel(frame: CGRectMake(0, 75, view.bounds.size.width-10, 21))
        title.text = game!.title
        title.font = UIFont(name: "HelveticaNeue-Bold", size: CGFloat(22))
        title.textColor = UIColor.whiteColor()
        title.textAlignment = .Right
        
        var mainCharacter = UILabel(frame: CGRectMake(0, 100, view.bounds.size.width-10, 21))
        mainCharacter.text = game!.mainCharacter
        mainCharacter.font = UIFont(name: "HelveticaNeue-BoldItalic", size: CGFloat(16))
        mainCharacter.textColor = UIColor.whiteColor()
        mainCharacter.textAlignment = .Right
        
        var bodyCopy = UILabel(frame: CGRectMake(10, imageHeight + 70, view.bounds.size.width-20, 200))
        bodyCopy.text = game!.bodyCopy
        bodyCopy.font = UIFont(name: "HelveticaNeue", size: CGFloat(16))
        bodyCopy.textColor = UIColor.whiteColor()
        bodyCopy.numberOfLines = 0
        bodyCopy.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        
        self.view.addSubview(leadImageView)
       
        self.view.addSubview(title)
        self.view.addSubview(mainCharacter)
        self.view.addSubview(bodyCopy)
    }
}