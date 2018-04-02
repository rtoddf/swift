import UIKit

class ViewController: UIViewController {
    
    let zoomImageView = UIImageView()
    let startingFrame = CGRect(x: 0, y: 0, width: 200, height: 112.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomImageView.isUserInteractionEnabled = true
        zoomImageView.frame = startingFrame
        zoomImageView.image = UIImage(named: "travis-wall")
        zoomImageView.contentMode = .scaleAspectFill
        zoomImageView.clipsToBounds = true
        
        zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animateView)))
        
        view.addSubview(zoomImageView)
    }
    
    @objc func animateView(){
        UIView.animate(withDuration: 0.75) {
            let height = (self.view.frame.width / self.startingFrame.width) * self.startingFrame.height
            let y = (self.view.frame.height / 2) - (height / 2)
            
            self.zoomImageView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
        }
    }
}

