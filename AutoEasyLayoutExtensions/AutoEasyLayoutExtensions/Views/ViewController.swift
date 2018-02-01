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
        firstImageView.setDisplay(size: largeViewWidth)

        let secondImageView = UIImageView()
        secondImageView.image = UIImage(named: "adam-lambert")
        secondImageView.setDisplay(size: smallViewWidth)

        let thirdImageView = UIImageView()
        thirdImageView.image = UIImage(named: "ben-barnes")
        thirdImageView.setDisplay(size: smallViewWidth)
        
        let fourthImageView = UIImageView()
        fourthImageView.image = UIImage(named: "matt-bomer")
        fourthImageView.setDisplay(size: smallViewWidth)
        
        let fifthImageView = UIImageView()
        fifthImageView.image = UIImage(named: "michael-j-willett")
        fifthImageView.setDisplay(size: smallViewWidth)
        
        let sixthImageView = UIImageView()
        sixthImageView.image = UIImage(named: "robin-lord-taylor")
        sixthImageView.setDisplay(size: smallViewWidth)

        let firstView = UIView()
        let secondView = UIView()
        let thirdView = UIView()
        let fourthView = UIView()
        let fifthView = UIView()
        let sixthView = UIView()
        
        firstView.addSubview(firstImageView)
        secondView.addSubview(secondImageView)
        thirdView.addSubview(thirdImageView)
        fourthView.addSubview(fourthImageView)
        fifthView.addSubview(fifthImageView)
        sixthView.addSubview(sixthImageView)

        [firstView, secondView, thirdView, fourthView, fifthView, sixthView].forEach { view.addSubview($0) }

        //        firstView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        firstView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, size: .init(width: largeViewWidth, height: largeViewWidth))
        
        secondView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: firstView.trailingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: smallViewWidth, height: smallViewWidth))
        
        thirdView.anchor(top: secondView.bottomAnchor, leading: firstView.trailingAnchor, bottom: firstView.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: smallViewWidth, height: smallViewWidth))

        fourthView.anchor(top: firstView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, size: .init(width: smallViewWidth, height: smallViewWidth))
        
        fifthView.anchor(top: firstView.bottomAnchor, leading: fourthView.trailingAnchor, bottom: nil, trailing: nil, size: .init(width: smallViewWidth, height: smallViewWidth))
        
        sixthView.anchor(top: firstView.bottomAnchor, leading: fifthView.trailingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: smallViewWidth, height: smallViewWidth))
    }

}
