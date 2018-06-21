import UIKit

class LayoutCell:BaseCell {
    var groupCellIndexSet:Int = 0
    var layoutCellIndexSet:Int = 0
    
    var groupCellIndex: Int!{
        didSet {
            guard let groupCellIndex = groupCellIndex else { return }
            groupingLabel.text = "Grouping: \(groupCellIndex)"
            self.groupCellIndexSet = groupCellIndex
        }
    }
    
    var layoutCellIndex: Int!{
        didSet {
            guard let layoutCellIndex = layoutCellIndex else { return }
            detailLabel.text = "Layout: \(layoutCellIndex)"
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
    
    let groupingLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
    
    let detailLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .green
        return label
    }()
    
    let dividerLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#999")
        return view
    }()
    
    override func setupViews() {
        addSubview(groupingLabel)
        addSubview(detailLabel)
        addSubview(dividerLine)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: groupingLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: detailLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLine)
        addConstraintsWithFormat(format: "V:|[v0][v1][v2(0.5)]|", views: groupingLabel, detailLabel, dividerLine)
    }
}
