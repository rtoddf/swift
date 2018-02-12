// https://www.youtube.com/watch?v=nv1L3mYEg8M - ep2 - 20:56

import UIKit

class ViewController: UIViewController {

    let topHalfView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "eli-lieb")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let textView:UITextView = {
        let tv = UITextView()
        
        var attributedText = NSMutableAttributedString(string: "Eli Lieb is an American pop singer-songwriter", attributes: [NSAttributedStringKey.font: UIFont(name: "Avenir-Black", size: 16.0) as Any, NSAttributedStringKey.foregroundColor: UIColor(hexString: "#333333") as Any])
        attributedText.append(NSAttributedString(string: "\n\nLieb is openly gay, a subject that returns repeatedly in his songs and music videos.", attributes: [NSAttributedStringKey.font: UIFont(name: "Avenir-Medium", size: 14.0) as Any, NSAttributedStringKey.foregroundColor: UIColor(hexString: "#777777") as Any]))
        
        tv.attributedText = attributedText
        
//        tv.font = UIFont(name: "Avenir-Black", size: 16.0)
//        tv.textColor  = UIColor(hexString: "#666666")
        tv.textAlignment = .center
        tv.isSelectable = false
        tv.isScrollEnabled = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
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

        setLayout()
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
    
    func setLayout() {
        view.addSubview(topHalfView)
        topHalfView.addSubview(imageView)
        view.addSubview(textView)
        
        topHalfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        topHalfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1).isActive = true
        topHalfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1).isActive = true
        topHalfView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true

        
        imageView.centerXAnchor.constraint(equalTo: topHalfView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topHalfView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: topHalfView.widthAnchor, multiplier: 1).isActive = true
        imageView.heightAnchor.constraint(equalTo: topHalfView.heightAnchor, multiplier: 1).isActive = true
        
        textView.topAnchor.constraint(equalTo: topHalfView.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
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

