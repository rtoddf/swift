import UIKit

// super class
class BaseCell:UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell {
    // var to be used in homecontroller
    var video:Video? {
        didSet {
            titleLabel.text = video?.title
//            guard let imageName = video?.thumbnailImageName else { return }
//            thumbnailImageView.image = UIImage(named: imageName)
            
            setupThumbnailImage()
            
            setupProfileImage()
            
//            guard let profImageName = video?.channel?.profileImageName else { return }
//            userProfileImageView.image = UIImage(named: profImageName)
            
            guard let channelName = video?.channel?.channelName else { return }
            guard let numberOfViews = video?.numberOfViews else { return }
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            guard let numberOfViewsFormatted = numberFormatter.string(from: numberOfViews) else { return }
            let subtitleText:String = "\(channelName) - \(numberOfViewsFormatted) - 2 years ago"
            subtitleTextView.text = subtitleText
            
            // measure titletext
            if let title = video?.title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                titleLabelHeightConstraint?.constant = estimatedRect.size.height > 20 ? 44 : 20
            }
            
        }
    }
    
    func setupThumbnailImage() {
        guard let thumbnailImageUrl = video?.thumbnailImageName else { return }
        thumbnailImageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
    }
    
    func setupProfileImage() {
        guard let profileImageNameUrl = video?.channel?.profileImageName else { return }
        userProfileImageView.loadImageUsingUrlString(urlString: profileImageNameUrl)
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "darren-criss")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230).cgColor
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jonathan-groff")
        imageView.layer.cornerRadius = 22
        // don't forget this
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Darren Everett Criss"
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleTextView:UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.text = "An American actor, singer and songwriter and is one of the founding members and co-owners of StarKid Productions"
        textview.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textview.textColor = UIColor.lightGray
        return textview
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    
    var titleLabelHeightConstraint:NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        addSubview(separatorView)
        // CGRectMake is no longer available in Swift
        // https://code.i-harness.com/en/q/2583b59
        //        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
        // thumbnailImageView.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
        
        // ex
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // ex
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView, "v1": separatorView]))
        
        // vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-28-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        
        // ex
        // addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": separatorView]))
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": separatorView]))
        
        // label - top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel,  attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        // left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel,  attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        // right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel,  attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // height constraint
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel,  attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        guard let tlhc = titleLabelHeightConstraint else { return }
        addConstraint(tlhc)
        
        //        addConstraintsWithFormat(format: "V:[v0(20)]", views: titleLabel)
        
        // textview - top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView,  attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 2))
        // left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView,  attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        // right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView,  attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        // height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView,  attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        //        addConstraintsWithFormat(format: "V:[v0(20)]", views: subtitleTextView)
    }
}
