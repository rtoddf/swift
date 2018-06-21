import UIKit

class GroupingCell:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let layoutCellId = "layoutCellId"
    var groupCellIndexSet:Int = 0
    
    var groupCellIndex: Int!{
        didSet {
            guard let groupCellIndex = groupCellIndex else { return }
            self.groupCellIndexSet = groupCellIndex
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = false
        collectionView.register(LayoutCell.self, forCellWithReuseIdentifier: layoutCellId)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
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
    
    let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "layoutCellId", for: indexPath) as! LayoutCell
        cell.groupCellIndex = groupCellIndex
        cell.layoutCellIndex = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    let dividerLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#333")
        return view
    }()
    
    override func setupViews(){
        addSubview(collectionView)
        addSubview(dividerLine)

        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLine)
        addConstraintsWithFormat(format: "V:|[v0][v1(0.5)]|", views: collectionView, dividerLine)
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
