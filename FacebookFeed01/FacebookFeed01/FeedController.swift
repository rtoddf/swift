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
    var statusText:String?
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
        postOne.statusText = "Speaking to the New York Post's Page Six in June 2016, Tortorella declared himself to be sexually fluid."
        postOne.subStatus = "In 2016, Tortorella launched his podcast The Love Bomb"
        
        let postTwo = Post()
        postTwo.name = "Ben Barnes"
        postTwo.description = "\nBenjamin Thomas Barnes is a British actor and singer."
        postTwo.imageName = "ben_barnes_square"
        postTwo.statusImageName = "ben_barnes"
        postTwo.statusText = """
        On 20 July 2015 it was announced that Barnes would replace Eion Bailey as Logan in HBO's science fiction thriller Westworld, the first season of which aired in the fall of 2016.
        
        We can save this world.
        We can burn it to the ground.
        From the ashes, build a new world.
        Our world.
        """
        postTwo.subStatus = "In 2016, Barnes was cast in the Marvel Netflix series The Punisher"
        
        let postThree = Post()
        postThree.name = "Tom Daley"
        postThree.description = "\nThomas Robert Daley is a British diver."
        postThree.imageName = "tom-daley-square"
        postThree.statusImageName = "tom-daley"
        postThree.statusText = "My reaction to others’ hate, bigotry & misinformation will not include anger or hate. For me, the path forward is lit with curiosity, listening, correcting the record when possible, and as best I can, leading with an example of strength & love."
        postThree.subStatus = "Daley and Black married at Bovey Castle in Devon on 6 May 2017"
        
        posts.append(postOne)
        posts.append(postTwo)
        posts.append(postThree)
        
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
        
        let statusImageHeight = view.frame.width * (9/16)
        
        if let statusText = posts[indexPath.item].statusText {
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
