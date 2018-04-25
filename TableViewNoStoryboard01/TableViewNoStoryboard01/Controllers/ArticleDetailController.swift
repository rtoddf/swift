import UIKit

class ArticleDetailController: UIViewController {
    
    var article:Article? {
        didSet {
            guard let headline = article?.headline else { return }
            guard let subhead = article?.subhead else { return }
            guard let leadImage = article?.images?[0].path else { return }
            guard let caption = article?.images?[0].caption else { return }
            guard let credit = article?.images?[0].credit else { return }
            
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
    
    func setupViews(){
        view.addSubview(headlineLabel)
        view.addSubview(subheadLabel)
        view.addSubview(leadImageView)
        view.addSubview(imageInfoLabel)
        
        let width = view.frame.width
        let height = (9 / 16) * width
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headlineLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": subheadLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": leadImageView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageInfoLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-75-[v0(25)]-8-[v1]-8-[v2(\(height))]-8-[v3]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headlineLabel, "v1": subheadLabel, "v2": leadImageView, "v3": imageInfoLabel]))
    }
    
}
