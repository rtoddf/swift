import UIKit

class ArticleImageLeftCell:BaseCell {
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
        iv.backgroundColor = UIColor(hexString: "#999")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.5
        iv.backgroundColor = UIColor(hexString: "#333")
        iv.layer.borderColor = UIColor(hexString: "#333")?.cgColor
        return iv
    }()
    
    let detailView:UIView = {
        let view = UIView()
        return view
    }()
    
    let headlineLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .articleHeadlineFont
        label.textColor = UIColor(hexString: "#222")
        label.numberOfLines = 2
        return label
    }()
    
    override func setupViews() {
        addSubview(leadImageView)
        addSubview(detailView)
        
        detailView.addSubview(headlineLabel)
        
        addConstraintsWithFormat(format: "H:|-12-[v0(\(frame.width / 3))]-12-[v1]-12-|", views: leadImageView, detailView)
        addConstraintsWithFormat(format: "V:|[v0]-12-|", views: leadImageView)
        addConstraintsWithFormat(format: "V:|[v0]-12-|", views: detailView)
        
        addConstraintsWithFormat(format: "H:|-2-[v0]-2-|", views: headlineLabel)
        addConstraintsWithFormat(format: "V:|[v0]", views: headlineLabel)
    }

}
