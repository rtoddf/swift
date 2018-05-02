// https://www.youtube.com/watch?v=2kwCfFG5fDA - youtube video

import UIKit

class Setting:NSObject {
    let name: String
    let imageName:String
    
    init(name:String, imageName:String){
        self.name = name
        self.imageName = imageName
    }
}

class SettingsLauncher:NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let blackView = UIView()
    
    let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    let cellId = "cellId"
    let cellHeight:CGFloat = 50
    
    let settings:[Setting] = {
        return [Setting(name: "Settings", imageName: "settings"), Setting(name: "Terms & Privacy Policy", imageName: "terms"), Setting(name: "Send Feedback", imageName: "settings"), Setting(name: "Help", imageName: "help"), Setting(name: "Switch Accounts", imageName: "settings"), Setting(name: "Cancel", imageName: "settings")]
    }()
    
    func showSettings(){
        // show menu
        guard let window = UIApplication.shared.keyWindow else { return }
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.35)
        
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        window.addSubview(blackView)
        window.addSubview(collectionView)
        
        
//        let height:CGFloat = CGFloat(settings.count) * cellHeight
//        let y = window.frame.height - height
//        collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
        
        let height:CGFloat = CGFloat(settings.count) * cellHeight
        let y = window.frame.height - height
        collectionView.frame = CGRect(x: (window.frame.width/2) * -1, y: 20, width: window.frame.width/2, height: window.frame.height)

        blackView.frame = window.frame
        blackView.alpha = 0
        
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
//            self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: height)
            self.collectionView.frame = CGRect(x: 0, y: 20, width: self.collectionView.frame.width, height: window.frame.height)
        }, completion: nil)
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.35, animations: {
            self.blackView.alpha = 0
            
            guard let window = UIApplication.shared.keyWindow else { return }
//            self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            self.collectionView.frame = CGRect(x: (window.frame.width/2) * -1, y: 20, width: window.frame.width/2, height: window.frame.height)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SettingCell
        
        let setting = settings[indexPath.item]
        cell?.setting = setting
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
    }
}
