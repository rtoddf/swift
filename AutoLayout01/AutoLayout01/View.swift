import UIKit

class View: UIView {
    // this!
    init(){
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor.whiteColor()
        setUpView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
//    var blueView: UIView?
//    var redView: UIView?
    
    var leadImageView: UIImageView?
    var image: UIImage?
    var gradientLayerView: UIView?
    var gradient: CAGradientLayer?
    
    private struct Settings {
        static let leadImageHeight: CGFloat = 250
        static let topLayoutGuideHeight: CGFloat = 35
        static let leadImageGradientOverlayLocations: [AnyObject] = [0.0, 0.25, 0.8, 1.0]
        static let leadImageGradientOverlayColors: [AnyObject] = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).CGColor,
            UIColor.clearColor().CGColor,
            UIColor.clearColor().CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
        ]
    }

    func setUpView(){
        self.image = UIImage(named: "assassins_creed_III.png")
        self.leadImageView = UIImageView()
        self.leadImageView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.leadImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        self.leadImageView!.image = self.image
        
        var leadImageHeight: Float = 250
        
        self.addSubview(self.leadImageView!)
        
        // NSLayout... enums are understood in Swift
        let imageViewXConst = NSLayoutConstraint(
            item: self.leadImageView!,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1.0,
            constant: Settings.topLayoutGuideHeight)
        
        let imageViewWidthConstraint = NSLayoutConstraint(
            item: self.leadImageView!,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Width,
            multiplier: 1.0,
            constant: 0)

        let imageViewHeightConstraint = NSLayoutConstraint(
            item: self.leadImageView!,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1.0,
            constant: Settings.leadImageHeight)
        
        self.addConstraints([imageViewXConst, imageViewWidthConstraint, imageViewHeightConstraint])
        
        // create gradient UIView
        self.gradientLayerView = UIView()
        self.gradientLayerView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.gradient = CAGradientLayer()
        self.gradient!.frame = leadImageView!.bounds
        self.gradient!.colors = Settings.leadImageGradientOverlayColors as [AnyObject]
        self.gradient!.locations = Settings.leadImageGradientOverlayLocations as [AnyObject]
        self.gradientLayerView!.layer.insertSublayer(gradient, atIndex: 5)
//        self.gradientLayerView?.backgroundColor = UIColor.purpleColor()
        self.leadImageView!.addSubview(self.gradientLayerView!)
        
        let gradientViewYConst = NSLayoutConstraint(
            item: self.gradientLayerView!,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1.0,
            constant: Settings.topLayoutGuideHeight)
        
        let gradientViewWidthConst = NSLayoutConstraint(item: self.gradientLayerView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 200)
        
        let gradientViewHeightConstraint = NSLayoutConstraint(
            item: self.gradientLayerView!,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Height,
            multiplier: 1.0,
            constant: Settings.leadImageHeight)
        
        self.addConstraints([gradientViewYConst, gradientViewWidthConst, gradientViewHeightConstraint])
        
//        self.blueView = UIView()
//        self.blueView?.backgroundColor = UIColor.blueColor()
//        self.blueView?.setTranslatesAutoresizingMaskIntoConstraints(false)
//        
//        self.addSubview(self.blueView!)
//
//        let blueViewCenterXContraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
//        
//        let blueViewCenterYContraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
//
//        let blueViewWidthConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 200)
//        
//        let blueViewHeightConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 200)
//
//        self.addConstraints([blueViewCenterXContraint, blueViewCenterYContraint, blueViewWidthConstraint, blueViewHeightConstraint])
//        
//        self.redView = UIView()
//        self.redView?.backgroundColor = UIColor.redColor()
//        self.redView?.setTranslatesAutoresizingMaskIntoConstraints(false)
//        self.addSubview(redView!)
//        
//        let redViewCenterXContraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
//        
//        let redViewCenterYContraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.blueView!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: -10)
//        
//        let redViewWidthConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 100)
//        
//        let redViewHeightConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 100)
//        
//        self.addConstraints([redViewCenterXContraint, redViewCenterYContraint, redViewWidthConstraint, redViewHeightConstraint])
    }

}
