// ep1 - https://www.youtube.com/watch?v=NJxb7EKXF3U&list=PL0dzCUj1L5JHDWIO3x4wePhD8G4d1Fa6N&index=1
// ep2 - https://www.youtube.com/watch?v=ZwBYQpLQAvw&list=PL0dzCUj1L5JHDWIO3x4wePhD8G4d1Fa6N&index=2
// ep3 - https://www.youtube.com/watch?v=L9cZrAbxN1E&list=PL0dzCUj1L5JHDWIO3x4wePhD8G4d1Fa6N&index=3
// https://www.raywenderlich.com/99087/swift-expanding-cells-ios-collection-views
// https://medium.com/@adinugroho/fixed-height-uicollectionview-inside-uitableview-79f24657d08f
// https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift

import UIKit

let cellId = "cellId"

struct People:Decodable {
    let people:[Person]
}

struct Person:Decodable {
    let name:String?
    var description:String?
    var profileImage:String?
    var statusImage:String?
    var statusText:String?
    var subStatusText:String?
}

//class Post {
//    var name:String?
//    var description:String?
//    var profileImage:String?
//    var statusImage:String?
//    var statusText:String?
//    var subStatusText:String?
//}

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
//    var posts = [Post]()
    var peeps = [Person]()
    
    func downloadJSON() {
        let jsonUrlString = "http://www.rtodd.net/swift/data/facebook.json"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            // take care of error
            
            guard let data = data else { return }
            
            do {
                let people  = try JSONDecoder().decode([Person].self, from:data)
                self.peeps = people
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            }.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON()
        
//        let postOne = Post()
//        postOne.name = "Nico Tortorella"
//        postOne.description = "\nNico Tortorella is an American actor and model."
//        postOne.profileImage = "nico"
//        postOne.statusImage = "nico-tortorella"
//        postOne.statusText = "Speaking to the New York Post's Page Six in June 2016, Tortorella declared himself to be sexually fluid."
//        postOne.subStatusText = "In 2016, Tortorella launched his podcast The Love Bomb"
//
//        let postTwo = Post()
//        postTwo.name = "Ben Barnes"
//        postTwo.description = "\nBenjamin Thomas Barnes is a British actor and singer."
//        postTwo.profileImage = "ben_barnes_square"
//        postTwo.statusImage = "ben_barnes"
//        postTwo.statusText = """
//        On 20 July 2015 it was announced that Barnes would replace Eion Bailey as Logan in HBO's science fiction thriller Westworld, the first season of which aired in the fall of 2016.
//
//        We can save this world.
//        We can burn it to the ground.
//        From the ashes, build a new world.
//        Our world.
//        """
//        postTwo.subStatusText = "In 2016, Barnes was cast in the Marvel Netflix series The Punisher"
//
//        let postThree = Post()
//        postThree.name = "Tom Daley"
//        postThree.description = "\nThomas Robert Daley is a British diver."
//        postThree.profileImage = "tom-daley-square"
//        postThree.statusImage = "tom-daley"
//        postThree.statusText = "My reaction to others’ hate, bigotry & misinformation will not include anger or hate. For me, the path forward is lit with curiosity, listening, correcting the record when possible, and as best I can, leading with an example of strength & love."
//        postThree.subStatusText = "Daley and Black married at Bovey Castle in Devon on 6 May 2017"
//
//        posts.append(postOne)
//        posts.append(postTwo)
//        posts.append(postThree)
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor(hexString: "#efefef")
        navigationItem.title = "Facebook Feed"
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peeps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CustomCell
        // reference post
        cell.person = peeps[indexPath.item]
        print("\(cell.person)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let statusImageHeight = view.frame.width * (9/16)
        
        if let statusText = peeps[indexPath.item].statusText {
            let rectConstraint = CGSize(width: view.frame.width, height: 1000)
            let rectOptions = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
            let rectAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]
            let rect = NSString(string: statusText).boundingRect(with: rectConstraint, options: rectOptions, attributes: rectAttributes, context: nil)
            let rectHeight = rect.height + (8 + 44 + 4 + 4 + statusImageHeight + 8 + 24 + 8 + 1 + 44) + 16
            
            return CGSize(width: view.frame.width, height: rectHeight)
        }
        
        return CGSize(width: view.frame.width, height: 500)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}

class CustomCell:UICollectionViewCell {
    var person: Person? {
        didSet {
            guard let name = person?.name else { return }
            guard let description = person?.description else { return }
            let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
            attributedText.append(NSAttributedString(string: description, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor(hexString: "#666666")]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
            
            nameLabel.attributedText = attributedText
            //        label.font = UIFont.boldSystemFont(ofSize: 14)
            //        label.translatesAutoresizingMaskIntoConstraints = false
            
            guard let profileImage = person?.profileImage else { return }
            profileImageView.image = UIImage(named: profileImage)
            
            guard let statusImage = person?.statusImage else { return }
            statusImageView.image = UIImage(named: statusImage)
            
            guard let statusText = person?.statusText else { return }
            statusTextView.text = statusText
            
            guard let subStatusText = person?.subStatusText else { return }
            subStatusLabel.text = subStatusText
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
        imageView.backgroundColor = UIColor(hexString: "#333333")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let statusTextView:UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
    }()
    
    let statusImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
        let statusImageHeight = frame.width * (9/16)
        
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
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(\(statusImageHeight))]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, statusTextView, statusImageView, subStatusLabel, separatorView, buttonStackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
