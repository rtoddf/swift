import UIKit

extension CAGradientLayer {
    
    func overlayGradient() -> CAGradientLayer {
        let colorOne = UIColor(red: 0.0, green: 0.2, blue: 0.4, alpha: 1.0)
        let colorTwo = UIColor(red: 0.0, green: 0.6, blue: 1.0, alpha: 0)
        let colorThree = UIColor(red: 0.0, green: 0.2, blue: 0.4, alpha: 1.0)
        
        let gradientColors: [CGColor] = [colorOne.CGColor, colorTwo.CGColor, colorTwo.CGColor, colorThree.CGColor]
        let gradientLocations: [Float] = [0.0, 0.25, 0.75, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
    
    func blueGradient(color: UIColor) -> CAGradientLayer {
        println("\(color)")
        
        let colorOne = UIColor(red: 0.0, green: 0.2, blue: 0.4, alpha: 1.0)
        let colorTwo = UIColor(red: 0.0, green: 0.6, blue: 1.0, alpha: 0)
        let colorThree = UIColor(red: 0.0, green: 0.2, blue: 0.4, alpha: 1.0)
        
        let gradientColors: [CGColor] = [colorOne.CGColor, colorTwo.CGColor, colorTwo.CGColor, colorThree.CGColor]
        let gradientLocations: [Float] = [0.0, 0.25, 0.75, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
   
}
