import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let smallViewWidth = view.frame.width * 0.333
        let largeViewWidth = view.frame.width * 0.67
        
        
        let firstView = UIView()
        firstView.layer.cornerRadius = 8
        firstView.clipsToBounds = true
        
        let firstImageView = UIImageView()
        firstImageView.image = UIImage(named: "adam-lambert")
        firstImageView.frame = CGRect(x: 0, y: 0, width: smallViewWidth, height: smallViewWidth)
        firstImageView.contentMode = .scaleAspectFill
        firstView.addSubview(firstImageView)
        
        let secondView = UIView()
        secondView.layer.cornerRadius = 8
        secondView.clipsToBounds = true
        
        let secondImageView = UIImageView()
        secondImageView.image = UIImage(named: "ben-barnes")
        secondImageView.frame = CGRect(x: 0, y: 0, width: smallViewWidth, height: smallViewWidth)
        secondImageView.contentMode = .scaleAspectFill
        secondView.addSubview(secondImageView)
        
        let thirdView = UIView()
        thirdView.layer.cornerRadius = 8
        thirdView.clipsToBounds = true
        
        let thirdImageView = UIImageView()
        thirdImageView.image = UIImage(named: "jonathan-groff")
        thirdImageView.frame = CGRect(x: 0, y: 0, width: largeViewWidth, height: largeViewWidth)
        thirdImageView.contentMode = .scaleAspectFill
        thirdView.addSubview(thirdImageView)
        
        [firstView, secondView, thirdView].forEach { view.addSubview($0) }
        
        
        
//        view.addSubview(firstView)
//        view.addSubview(secondView)
        
        // enables autolayout
//        firstView = false
//
//        firstView(equalTo: view.topAnchor).isActive = true
//        firstView(equalTo: view.leadingAnchor).isActive = true
//        firstView(equalTo: view.trailingAnchor).isActive = true
//        firstView(equalTo: view.bottomAnchor).isActive = true
        
//        firstView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        firstView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: smallViewWidth, height: smallViewWidth))
        
        secondView.anchor(top: firstView.bottomAnchor, leading: nil, bottom: nil, trailing: firstView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0) , size: .init(width: smallViewWidth, height: smallViewWidth))
        
        thirdView.anchor(top: firstView.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: secondView.bottomAnchor, trailing: firstView.leadingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
        
    }

}

extension UIView {
    func anchor(top:NSLayoutYAxisAnchor?, leading:NSLayoutXAxisAnchor?, bottom:NSLayoutYAxisAnchor?, trailing:NSLayoutXAxisAnchor?, padding:UIEdgeInsets = .zero, size:CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .purple
        
//        topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        
//        guard let top = top else { return }
//        guard let leading = leading else { return }
//        guard let bottom = bottom else { return }
//        guard let trailing = trailing else { return }
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }

        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        // bottom and right padding have to be nagative
    }
}










