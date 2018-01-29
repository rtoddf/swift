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
        let height = view.frame.width * 9/16
        return CGSize(width: view.frame.width, height: height + 50)
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
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        let titleColor = UIColor(hexString: "#333333")
        label.text = "Mayor on fighting Good Sam closure: ‘We’re looking at all our options’"
        label.textColor = titleColor
        return label
    }()
    
    let textLabel:UITextView = {
        let tl = UITextView()
        let textColor = UIColor(hexString: "#707070")
        tl.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        tl.text = "Mayor on fighting Good Sam closure: ‘We’re looking at all our options’"
        tl.textColor = textColor
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

        addConstraintsWithFormat(format: "V:|[v0]-8-[v1(20)]-4-[v2(30)]-16-[v3(1)]|", views: leadImageView, titleLabel, textLabel, dividerLine)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
