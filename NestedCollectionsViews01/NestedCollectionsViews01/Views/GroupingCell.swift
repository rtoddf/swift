import UIKit

class GroupingCell:BaseCell {
    var cellIndex: Int!{
        didSet {
            guard let cellIndex = cellIndex else { return }
            groupingLabel.text = "Grouping: \(cellIndex)"
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
        return label
    }()
    
    let dividerLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#333")
        return view
    }()
    
    override func setupViews(){
        addSubview(groupingLabel)
        addSubview(dividerLine)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: groupingLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLine)
        addConstraintsWithFormat(format: "V:|[v0][v1(0.5)]|", views: groupingLabel, dividerLine)
    }
}

class BaseCell:UICollectionViewCell {
    var count = Int()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
