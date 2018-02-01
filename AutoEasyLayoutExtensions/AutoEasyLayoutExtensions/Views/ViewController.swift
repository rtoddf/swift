import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
//        let viewPadding:CGFloat = 12.0
        
        let smallViewWidth = (view.frame.width * 0.333)
        let largeViewWidth = (view.frame.width * 0.67)
        
        let firstImageView = UIImageView()
        firstImageView.image = UIImage(named: "jonathan-groff")
        firstImageView.frame = CGRect(x: 0, y: 0, width: largeViewWidth, height: largeViewWidth)
        firstImageView.contentMode = .scaleAspectFit
        
        
        let secondImageView = UIImageView()
        secondImageView.image = UIImage(named: "adam-lambert")
        secondImageView.frame = CGRect(x: 0, y: 0, width: smallViewWidth, height: smallViewWidth)
        secondImageView.contentMode = .scaleAspectFill

        let thirdImageView = UIImageView()
        thirdImageView.image = UIImage(named: "ben-barnes")
        thirdImageView.frame = CGRect(x: 0, y: 0, width: smallViewWidth, height: smallViewWidth)
        thirdImageView.contentMode = .scaleAspectFill

        
        
        
        
        let firstView = UIView()
        let secondView = UIView()
        let thirdView = UIView()
        let fourthView = UIView()
        let fifthView = UIView()
        let sixthView = UIView()
        
        firstView.addSubview(firstImageView)
        secondView.addSubview(secondImageView)
        thirdView.addSubview(thirdImageView)

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
        
        firstView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, size: .init(width: largeViewWidth, height: largeViewWidth))
        
        secondView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: firstView.trailingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: smallViewWidth, height: smallViewWidth))
        
        thirdView.anchor(top: secondView.bottomAnchor, leading: secondView.leadingAnchor, bottom: firstView.bottomAnchor, trailing: secondView.trailingAnchor)
        
        
        
        fourthView.anchor(top: firstView.bottomAnchor, leading: firstView.leadingAnchor, bottom: nil, trailing: nil, size: .init(width: smallViewWidth, height: smallViewWidth))
        
        fifthView.anchor(top: firstView.bottomAnchor, leading: fourthView.trailingAnchor, bottom: nil, trailing: nil, size: .init(width: smallViewWidth, height: smallViewWidth))
        
        sixthView.anchor(top: firstView.bottomAnchor, leading: fifthView.trailingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: smallViewWidth, height: smallViewWidth))
    }

}






