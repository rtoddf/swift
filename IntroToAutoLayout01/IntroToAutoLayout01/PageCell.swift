import UIKit

class PageCell:UICollectionViewCell {
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
        tv.textAlignment = .center
        tv.isSelectable = false
        tv.isScrollEnabled = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    func setLayout() {
        addSubview(topHalfView)
        topHalfView.addSubview(imageView)
        addSubview(textView)
        
        topHalfView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        topHalfView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 1).isActive = true
        topHalfView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 1).isActive = true
        topHalfView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: topHalfView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topHalfView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: topHalfView.widthAnchor, multiplier: 1).isActive = true
        imageView.heightAnchor.constraint(equalTo: topHalfView.heightAnchor, multiplier: 1).isActive = true
        
        textView.topAnchor.constraint(equalTo: topHalfView.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
