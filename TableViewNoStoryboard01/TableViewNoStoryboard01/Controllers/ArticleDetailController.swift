import UIKit

class ArticleDetailController: UIViewController {
    
    var article:Article? {
        didSet {
            guard let headline = article?.headline else { return }
            guard let subhead = article?.subhead else { return }
            guard let leadImage = article?.images?[0].path else { return }
            guard let caption = article?.images?[0].caption else { return }
            guard let credit = article?.images?[0].credit else { return }
            guard let fullText = article?.fullText else { return }
            
            headlineLabel.text = headline
            subheadLabel.text = subhead
            leadImageView.loadImageUsingUrlString(imageUrl: leadImage)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 2
            
            let textAttributes:[NSAttributedStringKey:Any] = [
                .paragraphStyle: paragraphStyle,
                .font : UIFont(name: "Georgia", size: 12) as Any,
                .foregroundColor: UIColor(hexString: "#999999")
            ]
            
            let imageInfoAttributedText = caption + " (" + credit + ")"
            
            let attributedString = NSMutableAttributedString(string: imageInfoAttributedText, attributes: textAttributes)
            imageInfoLabel.attributedText = attributedString
            
            imageInfoLabel.frame = CGRect(x: 14, y: view.frame.height, width: view.frame.width - 28, height: imageInfoLabel.bounds.size.height)
            imageInfoLabel.numberOfLines = 0
            imageInfoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            imageInfoLabel.sizeToFit()
            
            fullTextView.text  = fullText
            
            self.view.frame.size.height = self.view.frame.height + 1000
            
            self.view.layoutIfNeeded()
            self.view.isUserInteractionEnabled = true
            fullTextView.invalidateIntrinsicContentSize()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#ffffff")
        setupViews()
        
//        printFonts()
    }
    
    let headlineLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia-Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subheadLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia", size: 16)
        label.textColor = UIColor(hexString: "#333333")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let leadImageView:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor(hexString: "#000000")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
//        iv.layer.borderColor = UIColor(hexString: "#333333").cgColor
//        iv.layer.borderWidth = 1.0
        iv.addBorders(edges: [.top, .bottom], color: UIColor(hexString: "#666666"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let imageInfoLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fullTextView:UITextView = {
        let tv = UITextView()
        tv.font = UIFont(name: "Georgia", size: 14)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func setupViews(){
        view.addSubview(headlineLabel)
        view.addSubview(subheadLabel)
        view.addSubview(leadImageView)
        view.addSubview(imageInfoLabel)
        view.addSubview(fullTextView)
        
        let width = view.frame.width
        let height = (9 / 16) * width
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headlineLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": subheadLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": leadImageView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": fullTextView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageInfoLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-75-[v0(25)]-8-[v1]-8-[v2(\(height))]-8-[v3]-8-[v4(2000)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headlineLabel, "v1": subheadLabel, "v2": leadImageView, "v3": imageInfoLabel, "v4": fullTextView]))
        
//        view.addConstraint(NSLayoutConstraint(item: fullTextView, attribute: .bottom, relatedBy: .equal, toItem: self.view.frame, attribute: .bottom, multiplier: 1.0, constant: 0))
    }
    
}
