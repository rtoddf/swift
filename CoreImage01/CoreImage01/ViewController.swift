import UIKit

// http://www.ioscreator.com/tutorials/core-image-tutorial-ios8-swift
// http://www.raywenderlich.com/76285/beginning-core-image-swift

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let image = UIImage(named: "travis_wall.png")
    var whichFilter = CIFilter(name: "CIGaussianBlur")
    // CIPhotoEffectMono, CISepiaTone, CIZoomBlur, CIVignetteEffect, CIGaussianBlur

    override func viewDidLoad() {
        super.viewDidLoad()

        self.runImageFilter(self.image!, filter: self.whichFilter!)
        self.logAllFilters()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runImageFilter(image: UIImage, filter:CIFilter){
        let originalImage = CIImage(image: image)

        filter.setDefaults()
        filter.setValue(originalImage, forKey: kCIInputImageKey)
        
        var outputImage = filter.outputImage
        var newImage = UIImage(CIImage: outputImage)
        imageView.image = newImage
    }
    
    func logAllFilters() {
        let properties = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        println(properties)
        
//        for filterName: AnyObject in properties {
//            let fltr = CIFilter(name:filterName as String)
//            println(fltr.attributes())
//        }
    }


}

