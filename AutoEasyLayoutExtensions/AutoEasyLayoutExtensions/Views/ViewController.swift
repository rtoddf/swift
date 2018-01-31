import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        let viewPadding:CGFloat = 12.0
        
        let smallViewWidth = (view.frame.width * 0.333) - viewPadding
        let largeViewWidth = (view.frame.width * 0.67) - viewPadding
        
        let firstImageView = UIImageView()
        firstImageView.image = UIImage(named: "adam-lambert")
        firstImageView.frame = CGRect(x: 0, y: 0, width: smallViewWidth, height: smallViewWidth)
        firstImageView.contentMode = .scaleAspectFill
        
        let firstView = UIView()
        firstView.addSubview(firstImageView)
        
        let secondImageView = UIImageView()
        secondImageView.image = UIImage(named: "ben-barnes")
        secondImageView.frame = CGRect(x: 0, y: 0, width: smallViewWidth, height: smallViewWidth)
        secondImageView.contentMode = .scaleAspectFill
        
        let secondView = UIView()
        secondView.addSubview(secondImageView)
        
        let thirdImageView = UIImageView()
        thirdImageView.image = UIImage(named: "adam-lambert")
        thirdImageView.frame = CGRect(x: 0, y: 0, width: largeViewWidth, height: largeViewWidth)
        thirdImageView.contentMode = .scaleAspectFit
        
        let thirdView = UIView()
        thirdView.addSubview(thirdImageView)
        
        let fourthView = UIView()
        let fifthView = UIView()
        let sixthView = UIView()
        
        [firstView, secondView, thirdView, fourthView, fifthView, sixthView].forEach { view.addSubview($0) }
        
        
        
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
        
        firstView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: CGFloat(viewPadding)), size: .init(width: smallViewWidth, height: smallViewWidth))
        
        secondView.anchor(top: firstView.bottomAnchor, leading: nil, bottom: nil, trailing: firstView.trailingAnchor, padding: .init(top: viewPadding, left: 0, bottom: 0, right: 0) , size: .init(width: smallViewWidth, height: smallViewWidth))
        
        thirdView.anchor(top: firstView.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: secondView.bottomAnchor, trailing: firstView.leadingAnchor, padding: .init(top: 0, left: viewPadding, bottom: 0, right: viewPadding))
        
        fourthView.anchor(top: thirdView.bottomAnchor, leading: thirdView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: viewPadding, left: 0, bottom: 0, right: viewPadding), size: .init(width: smallViewWidth, height: smallViewWidth))
        
        fifthView.anchor(top: thirdView.bottomAnchor, leading: fourthView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: viewPadding, left: viewPadding, bottom: 0, right: viewPadding), size: .init(width: smallViewWidth, height: smallViewWidth))
        
        sixthView.anchor(top: thirdView.bottomAnchor, leading: fifthView.trailingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }

}






