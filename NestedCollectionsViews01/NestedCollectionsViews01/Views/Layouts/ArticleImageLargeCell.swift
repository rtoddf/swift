import UIKit

class ArticleImageLargeCell:BaseCell {
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
//            headlineLabel.text = "Layout: \(layoutCellIndex)"
            self.layoutCellIndexSet = layoutCellIndex
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
        iv.backgroundColor = .orange
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.5
        iv.backgroundColor = UIColor(hexString: "#333")
        iv.layer.borderColor = UIColor(hexString: "#333")?.cgColor
        return iv
    }()
    
    let headlineLabel:UILabel = {
        let label = UILabel()
        label.font = .articleHeadlineFont
        label.textColor = UIColor(hexString: "#222")
        label.numberOfLines = 2
        return label
    }()
    
    override func setupViews() {
        addSubview(leadImageView)
        addSubview(headlineLabel)
        
        let imageWidth = frame.width
        let imageHeight = (9 / 16) * imageWidth
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: leadImageView)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: headlineLabel)
        
        addConstraintsWithFormat(format: "V:|-12-[v0(\(imageHeight))]-4-[v1]", views: leadImageView, headlineLabel)
    }
}

















