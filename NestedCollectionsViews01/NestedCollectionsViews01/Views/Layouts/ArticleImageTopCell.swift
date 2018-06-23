import UIKit

class ArticleImageTopCell:BaseCell {
    var groupCellIndexSet:Int = 0
    var layoutCellIndexSet:Int = 0
    
    var groupCellIndex: Int!{
        didSet {
            guard let groupCellIndex = groupCellIndex else { return }
            headlineLabel.text = "Grouping: \(groupCellIndex)"
            self.groupCellIndexSet = groupCellIndex
        }
    }
    
    var layoutCellIndex: Int!{
        didSet {
            guard let layoutCellIndex = layoutCellIndex else { return }
//            detailLabel.text = "Layout: \(layoutCellIndex)"
            self.layoutCellIndexSet = layoutCellIndex
        }
    }
    
    var article:Article? {
        didSet {
            guard let leadMedia = article?.leadMedia?.path else { return }
            guard let headline = article?.headline else { return }
            guard let summary = article?.summary else { return }
            guard let date = article?.date else { return }
            
            leadImageView.loadImageUsingUrlString(imageUrl: leadMedia)
            headlineLabel.text = headline
            detailsLabel.text = date.timeAgoDisplay()
            let attributedText = NSMutableAttributedString(string: summary, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor(hexString: "#333") as Any])
            textLabel.attributedText = attributedText
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let leadImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor(hexString: "#333333")
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor(hexString: "#333")?.cgColor
        return iv
    }()
    
    let headlineLabel:UILabel = {
        let label = UILabel()
        label.font = .titleFont
        label.numberOfLines = 2
        return label
    }()
    
    let detailsLabel:UILabel = {
        let label = UILabel()
        label.font = .articleDetailsFont
        label.textColor = UIColor(hexString: "#666")
        label.numberOfLines = 3
        return label
    }()
    
    let textLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = .articleBodyFont
        label.textColor = UIColor(hexString: "#222")
        return label
    }()

//    let dividerLine:UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(hexString: "#999")
//        return view
//    }()
    
    override func setupViews() {
        addSubview(leadImageView)
        addSubview(headlineLabel)
        addSubview(detailsLabel)
        addSubview(textLabel)
        
        let imageWidth = frame.width
        let imageHeight = (9 / 16) * imageWidth
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: leadImageView)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: headlineLabel)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: textLabel)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: detailsLabel)
        addConstraintsWithFormat(format: "V:|[v0(\(imageHeight))]-2-[v1]-2-[v2]-2-[v3]", views: leadImageView, headlineLabel, textLabel, detailsLabel)
    }
}
