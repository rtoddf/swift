import UIKit

class CustomCell:UITableViewCell {
    var article:Article? {
        didSet {
            guard let headline = article?.headline else { return }
            guard let summary = article?.summary else { return }
            guard let leadImage = article?.leadImage else { return }
            
            headlineLabel.text = headline

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 3
            
            let textAttributes:[NSAttributedStringKey:Any] = [
                .paragraphStyle: paragraphStyle,
                .font : UIFont.systemFont(ofSize: 12)
//                ,.foregroundColor: UIColor(hexString: "#777777")
            ]
            
            let attributedString = NSMutableAttributedString(string: summary, attributes: textAttributes)
            summaryLabel.attributedText = attributedString
            
            leadImageView.loadImageUsingUrlString(imageUrl: leadImage)
            
//            summaryLabel.sizeToFit()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    let headlineLabel:UILabel = {
        let label = UILabel()
        label.text = "Label text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(hexString: "#333333")
        return label
    }()
    
    let summaryLabel:UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.systemFont(ofSize: 12)
        tv.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tv.textContainer.lineFragmentPadding = 0
        tv.isUserInteractionEnabled = false
        return tv
    }()
    
    let leadImageView:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .orange
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(headlineLabel)
        addSubview(summaryLabel)
        addSubview(leadImageView)

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v1]-8-[v0(75)]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": leadImageView, "v1": headlineLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(75)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": leadImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headlineLabel]))
        
        addConstraint(NSLayoutConstraint(item: summaryLabel, attribute: .left, relatedBy: .equal, toItem: headlineLabel, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: summaryLabel, attribute: .right, relatedBy: .equal, toItem: headlineLabel, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: summaryLabel, attribute: .top, relatedBy: .equal, toItem: headlineLabel, attribute: .bottom, multiplier: 1.0, constant: 6.0))
        addConstraint(NSLayoutConstraint(item: summaryLabel, attribute: .bottom, relatedBy: .equal, toItem: leadImageView, attribute: .bottom, multiplier: 1.0, constant: 0))
    }
}
