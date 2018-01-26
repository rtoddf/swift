import UIKit

class SettingsLauncher:NSObject {
    let blackView = UIView()
    
    func showSettings(){
        // show menu
        guard let window = UIApplication.shared.keyWindow else { return }
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.35)
        
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        window.addSubview(blackView)
        blackView.frame = window.frame
        blackView.alpha = 0
        
        UIView.animate(withDuration: 0.35, animations: {
            self.blackView.alpha = 1
        })
    }
    
    @objc func handleDismiss() {
        print("dismiss")
        UIView.animate(withDuration: 0.35, animations: {
            self.blackView.alpha = 0
        })
    }
    
    override init() {
        super.init()
    }
}
