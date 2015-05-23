import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainView = self.view

        let mars: UIImage = UIImage(named: "tom_daley")!
        
        let sv = mars.size
        let widthRatio = mainView.bounds.width / sv.width
        
        let iv = UIImageView(image: mars)
        iv.frame = CGRectMake(0, 0, mainView.bounds.size.width, mars.size.height * widthRatio)
        
        
        
        println("\(sv)")
        println("\(sv.height)")
        println("\(widthRatio)")
        
//        let imageTiled = mars.resizableImageWithCapInsets(UIEdgeInsetsZero, resizingMode: .Tile)
        
        mainView.addSubview(iv)
        
//        self.iv.image = imageTiled
        
//        let iv = UIImageView(image: image)
//        iv.frame = CGRectMake(0, 0, mainView.bounds.size.width, 100)
//        
//        mainView.addSubview(iv)
//        
//        iv.center = iv.superview!.bounds.center
//        iv.frame.integerize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

