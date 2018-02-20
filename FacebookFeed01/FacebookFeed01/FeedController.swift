// ep1 - https://www.youtube.com/watch?v=NJxb7EKXF3U&list=PL0dzCUj1L5JHDWIO3x4wePhD8G4d1Fa6N&index=1
// ep2 - https://www.youtube.com/watch?v=ZwBYQpLQAvw&list=PL0dzCUj1L5JHDWIO3x4wePhD8G4d1Fa6N&index=2
// ep3 - https://www.youtube.com/watch?v=L9cZrAbxN1E&list=PL0dzCUj1L5JHDWIO3x4wePhD8G4d1Fa6N&index=3
// https://www.raywenderlich.com/99087/swift-expanding-cells-ios-collection-views
// https://medium.com/@adinugroho/fixed-height-uicollectionview-inside-uitableview-79f24657d08f
// https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift

import UIKit

let cellId = "cellId"

class Post {
    var name:String?
    var description:String?
    var imageName:String?
    var statusImageName:String?
    var subStatus:String?
}

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postOne = Post()
        postOne.name = "Nico Tortorella"
        postOne.description = "\nNico Tortorella is an American actor and model."
        postOne.imageName = "nico"
        postOne.statusImageName = "nico-tortorella"
        postOne.subStatus = "In 2016, Tortorella launched his podcast The Love Bomb"
        
        let postTwo = Post()
        postTwo.name = "Ben Barnes"
        postTwo.description = "\nBenjamin Thomas Barnes is a British actor and singer."
        postTwo.imageName = "ben_barnes_square"
        postTwo.statusImageName = "ben_barnes"
        postTwo.subStatus = "In 2016, Barnes was cast in the Marvel Netflix series The Punisher"
        
        posts.append(postOne)
        posts.append(postTwo)
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor(hexString: "#efefef")
        navigationItem.title = "Facebook Feed"
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CustomCell
        // reference post
        cell.post = posts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: view.frame.width, height: 400)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }

}

class CustomCell:UICollectionViewCell {
    var post: Post? {
        didSet {
            guard let name = post?.name else { return }
            guard let description = post?.description else { return }
            let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
            attributedText.append(NSAttributedString(string: description, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor(hexString: "#666666")]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
            
            nameLabel.attributedText = attributedText
            //        label.font = UIFont.boldSystemFont(ofSize: 14)
            //        label.translatesAutoresizingMaskIntoConstraints = false
            
            guard let imageName = post?.imageName else { return }
            profileImageView.image = UIImage(named: imageName)
            
            guard let statusImageName = post?.statusImageName else { return }
            statusImageView.image = UIImage(named: statusImageName)
            
            guard let subStatus = post?.subStatus else { return }
            subStatusLabel.text = subStatus
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        return label
    }()
    
    let profileImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nico")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let statusTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Speaking to the New York Post's Page Six in June 2016, Tortorella declared himself to be sexually fluid."
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    let statusImageView:UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let subStatusLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#777777")
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#999999")
        return view
    }()
    
    let buttonStackView:UIStackView = {
        var stack = UIStackView()
        stack.distribution = .fillEqually

        let likeButton:UIButton = buttonGenerator(title: "Like", imageName: "home")
        let commentButton:UIButton = buttonGenerator(title: "Comment", imageName: "home")
        let shareButton:UIButton = buttonGenerator(title: "Share", imageName: "home")
        
        stack.addArrangedSubview(likeButton)
        stack.addArrangedSubview(commentButton)
        stack.addArrangedSubview(shareButton)
        
        return stack
    }()
    
    func setupViews(){
        backgroundColor = UIColor(hexString: "#ffffff")
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(subStatusLabel)
        addSubview(separatorView)
        addSubview(buttonStackView)

        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: subStatusLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: buttonStackView)
        
        addConstraintsWithFormat(format: "V:|-8-[v0]", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1(52)]-4-[v2]-8-[v3(24)]-8-[v4(1)][v5(44)]|", views: profileImageView, statusTextView, statusImageView, subStatusLabel, separatorView, buttonStackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
