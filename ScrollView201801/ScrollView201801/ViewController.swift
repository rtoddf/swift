import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = [UIImage(named: "deborah-harry")!, UIImage(named: "adam-lambert")!, UIImage(named: "ellen-page")!, UIImage(named: "music-brett-kissel")!, UIImage(named: "tyler-oakley")!]
        
        for i in 0..<imageArray.count {
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.mainScrollView.frame.width * CGFloat(i)
            
            
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
            mainScrollView.addSubview(imageView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

