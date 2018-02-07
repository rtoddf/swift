import UIKit

class BaseCell:UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StoryCell:BaseCell {
    let leadImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sports01")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let siteIconImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ben-barnes")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 22
        return iv
    }()
    
    let headlinelabel:UILabel = {
        let label = UILabel()
        label.text = "Sports Today: National Signing Day gives way to big basketball night"
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textLabel:UITextView = {
        let label = UITextView()
        label.text = "Today is National Signing Day and a notable night for college basketball."
        label.font = UIFont(name: "Avenir-Medium", size: 12.0)
        label.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        label.textColor = UIColor(hexString: "#333333")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#999999")
        return view
    }()
    
    override func setupViews() {
        addSubview(leadImageView)
        addSubview(separatorView)
        addSubview(siteIconImageView)
        addSubview(headlinelabel)
        addSubview(textLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: leadImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: siteIconImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-24-[v2(1)]|", views: leadImageView, siteIconImageView, separatorView)
        
        addConstraint(NSLayoutConstraint(item: headlinelabel, attribute: .top, relatedBy: .equal, toItem: leadImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: headlinelabel, attribute: .leading, relatedBy: .equal, toItem: siteIconImageView, attribute: .trailing, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: headlinelabel, attribute: .trailing, relatedBy: .equal, toItem: leadImageView, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: headlinelabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraint(NSLayoutConstraint(item: textLabel, attribute: .top, relatedBy: .equal, toItem: headlinelabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: textLabel, attribute: .leading, relatedBy: .equal, toItem: headlinelabel, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: textLabel, attribute: .trailing, relatedBy: .equal, toItem: headlinelabel, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: textLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 32))
    }
}
