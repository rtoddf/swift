import UIKit

class SettingsLauncher:NSObject {
    let blackView = UIView()
    
    let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func showSettings(){
        // show menu
        guard let window = UIApplication.shared.keyWindow else { return }
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.35)
        
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        window.addSubview(blackView)
        window.addSubview(collectionView)
        let height:CGFloat = 200
        let y = window.frame.height - height
        collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)

        blackView.frame = window.frame
        blackView.alpha = 0
        
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: height)
        }, completion: nil)
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.35, animations: {
            self.blackView.alpha = 0
            
            guard let window = UIApplication.shared.keyWindow else { return }
            self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        })
    }
    
    override init() {
        super.init()
    }
}
