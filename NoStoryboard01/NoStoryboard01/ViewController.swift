import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews(){
        let headerView:UIView = {
            let view = UIView()
            view.backgroundColor = .purple
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let titleLabel:UILabel = {
            let label = UILabel()
            label.text = "Numbers"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textColor = .white
            
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(headerView)
        headerView.addSubview(titleLabel)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(70)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerView]))
        
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleLabel]))
        
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleLabel]))
        
    }
    
    
}

