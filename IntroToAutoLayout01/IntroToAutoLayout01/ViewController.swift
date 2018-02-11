// https://www.youtube.com/watch?v=nv1L3mYEg8M - ep2

import UIKit

class ViewController: UIViewController {

    let topHalfView:UIView = {
        let view = UIView()
        view.backgroundColor = .orange
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
        tv.text = "Eli Lieb, an independent American pop singer-songwriter"
        tv.font = UIFont(name: "Avenir-Black", size: 16.0)
        tv.textColor  = UIColor(hexString: "#666666")
        tv.textAlignment = .center
        tv.isSelectable = false
        tv.isScrollEnabled = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(topHalfView)
        view.addSubview(imageView)
        view.addSubview(textView)
        setLayout()
//        printFonts()
    }
    
    func setLayout() {
        topHalfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1).isActive = true
        topHalfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1).isActive = true
        topHalfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1).isActive = true
        topHalfView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true

        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
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

