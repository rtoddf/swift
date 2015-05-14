import Foundation
import UIKit

class VideoGameDetail: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var game : VideoGame?
    
    private struct Settings {
        static let leadImageHeight: CGFloat = 250
        static let topLayoutGuideHeight: CGFloat = 35
        static let leadImageGradientOverlayLocations: [AnyObject] = [0.0, 0.30, 0.70, 1.0]
        static let leadImageGradientOverlayColors: [AnyObject] = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.0).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.0).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
        ]
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor()

        // create UIImageView
        var leadImageView = UIImageView(frame: CGRectMake(0, 0, view.bounds.size.width, Settings.leadImageHeight))
        var image = UIImage(named: game!.leadImage)
        leadImageView.image = image
        
        // create title UILabel
        var title = UILabel(frame: CGRectMake(10, 200, view.bounds.size.width, 21))
        title.text = game!.title
        title.font = UIFont(name: "HelveticaNeue-Bold", size: CGFloat(22))
        title.textColor = UIColor.whiteColor()
//        title.textAlignment = .Right
        
        // create subtitle UILabel
        var mainCharacter = UILabel(frame: CGRectMake(10, 225   , view.bounds.size.width, 21))
        mainCharacter.text = game!.mainCharacter
        mainCharacter.font = UIFont(name: "HelveticaNeue-BoldItalic", size: CGFloat(16))
        mainCharacter.textColor = UIColor.whiteColor()
//        mainCharacter.textAlignment = .Right
        
        // create bodycopy UILabel
        var bodyCopy = UILabel(frame: CGRectMake(10, Settings.leadImageHeight + 15, view.bounds.size.width-20, 1000))
        bodyCopy.text = game!.bodyCopy
        bodyCopy.font = UIFont(name: "HelveticaNeue", size: CGFloat(16))
        bodyCopy.textColor = UIColor.whiteColor()
        bodyCopy.numberOfLines = 0
        bodyCopy.lineBreakMode = NSLineBreakMode.ByWordWrapping
        // this!
        bodyCopy.sizeToFit()

        // create gradient UIView
        var gradientLayerView: UIView = UIView(frame: CGRectMake(0, 0, view.bounds.size.width, Settings.leadImageHeight))
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientLayerView.bounds
        gradient.colors = Settings.leadImageGradientOverlayColors
        gradient.locations = Settings.leadImageGradientOverlayLocations
        gradientLayerView.layer.insertSublayer(gradient, atIndex: 5)
        
        self.scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        self.scrollView.contentSize = CGSize(width: view.bounds.size.width, height: 1200)
        
        // add subviews and layers
        self.scrollView.addSubview(leadImageView)
        self.scrollView.layer.insertSublayer(gradientLayerView.layer, atIndex: 5)
        self.scrollView.addSubview(title)
        self.scrollView.addSubview(mainCharacter)
        self.scrollView.addSubview(bodyCopy)
        
        self.view.addSubview(scrollView)
    }
}