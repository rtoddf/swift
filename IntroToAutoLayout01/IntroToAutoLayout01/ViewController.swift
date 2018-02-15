// https://www.youtube.com/watch?v=nv1L3mYEg8M - ep2 - done
// https://www.youtube.com/watch?v=WCECFfelSHk - ep3 done
// https://www.youtube.com/watch?v=a5yjOMLBfSc&t=233s - ep 4 done
// https://www.youtube.com/watch?v=0PnQTeNzrLI - ep 5
// https://www.youtube.com/watch?v=TK0mxO469ok - ep 6
// https://www.youtube.com/watch?v=1UQ-Y1-FNMQ - ep 7

import UIKit

class ViewController: UIViewController {
    // look up encapsulation - private and fileprivate
    private let previousButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 14.0)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 14.0)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl:UIPageControl = {
        let pageCont = UIPageControl()
        pageCont.currentPage = 0
        pageCont.numberOfPages = 4
        pageCont.currentPageIndicatorTintColor = UIColor(hexString: "#ae0000")
        pageCont.pageIndicatorTintColor = UIColor.gray
        return pageCont
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupBottomControls()
//        printFonts()
    }
    
    func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
}

