import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var stories:[Story] = {
        var story1 = Story()
        story1.headline = "Mayor on fighting Good Sam closure: ‘We’re looking at all our options’"
        story1.leadImageName = "newsEngin.21079913"
        
        return [story1]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false
        collectionView?.backgroundColor = UIColor.white

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.textAlignment = NSTextAlignment.center
        navigationItem.titleView = titleLabel
        titleLabel.text = "Dayton"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

        let cellId:String = "cellId"
        collectionView?.register(StoryCell.self, forCellWithReuseIdentifier: cellId)
        
        setupNavbarButtons()
    }
    
    func setupNavbarButtons() {
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButtonItem]
    }
    
    @objc func handleMore(){
        print("more")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! StoryCell
        cell.story = stories[indexPath.item]
        
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
