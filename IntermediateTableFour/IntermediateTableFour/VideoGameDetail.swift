import Foundation
import UIKit

class VideoGameDetail: UIViewController {
//    var gameTitleText = String()
//    var characterText = String()
//    var imageText = String()
//    var descriptionText = String()
    
    var game : VideoGame?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor()
        
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