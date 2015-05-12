import Foundation
import UIKit

class VideoGameDetail: UIViewController {
    var gameTitleText = String()
    var characterText = String()
    var imageText = String()
    var descriptionText = String()
    
    override func viewDidLoad() {
//        let fontFamilyNames = UIFont.familyNames()
//        for familyName in fontFamilyNames {
//            println("------------------------------")
//            println("Font Family Name = [\(familyName)]")
//            let names = UIFont.fontNamesForFamilyName(familyName as! String)
//            println("Font Names = [\(names)]")
//        }
        
        self.view.backgroundColor = UIColor.blackColor()
        
        var imageHeight = view.bounds.size.width * 0.66
        
        var imageView = UIImageView(frame: CGRectMake(0, 65, view.bounds.size.width, imageHeight))
        var image = UIImage(named: imageText)
        imageView.image = image
        
        var gameTitle = UILabel(frame: CGRectMake(0, 75, view.bounds.size.width-10, 21))
        gameTitle.text = gameTitleText
        gameTitle.font = UIFont(name: "HelveticaNeue-Bold", size: CGFloat(22))
        gameTitle.textColor = UIColor.whiteColor()
        gameTitle.textAlignment = .Right
        
        var mainCharacter = UILabel(frame: CGRectMake(0, 100, view.bounds.size.width-10, 21))
        mainCharacter.text = characterText
        mainCharacter.font = UIFont(name: "HelveticaNeue-BoldItalic", size: CGFloat(16))
        mainCharacter.textColor = UIColor.whiteColor()
        mainCharacter.textAlignment = .Right
        
        var gameDescription = UILabel(frame: CGRectMake(10, imageHeight + 70, view.bounds.size.width-20, 200))
        gameDescription.text = descriptionText
        gameDescription.font = UIFont(name: "HelveticaNeue", size: CGFloat(16))
        gameDescription.textColor = UIColor.whiteColor()
        gameDescription.numberOfLines = 0
        gameDescription.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        self.view.addSubview(imageView)
        self.view.addSubview(gameTitle)
        self.view.addSubview(mainCharacter)
        self.view.addSubview(gameDescription)
    }
}