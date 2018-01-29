import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Dayton "
        collectionView?.backgroundColor = UIColor.white
        
        let cellId:String = "cellId"
        collectionView?.register(StoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}



class StoryCell:UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    let leadImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "newsEngin.21079913")
//        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        let textColor = UIColor(hexString: "#333333")
        label.backgroundColor = textColor
        return label
    }()
    
    let textLabel:UILabel = {
        let tl = UILabel()
        let textColor = UIColor(hexString: "#333333")
        tl.backgroundColor = textColor
        return tl
    }()
    
    let dividerLine:UIView = {
        let dl = UIView()
        let textColor = UIColor(hexString: "#333333")
        dl.backgroundColor = textColor
        return dl
    }()
    
    func setupViews(){
        addSubview(leadImageView)
        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(dividerLine)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: leadImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: textLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLine)

        addConstraintsWithFormat(format: "V:|[v0]-8-[v1(20)]-8-[v2(20)]-16-[v3(1)]|", views: leadImageView, titleLabel, textLabel, dividerLine)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
