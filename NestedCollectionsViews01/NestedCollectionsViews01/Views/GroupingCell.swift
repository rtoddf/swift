import UIKit

class GroupingCell:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let feedMusicSource = "reviews-music"
    let feedMoviesSource = "reviews-movies"
    let version = ""
    let menuFeed = "http://rtodd.net/swift/data/menu-music.json"
    
    let articleImageLargeCellId = "articleImageLargeCellId"
    let articleImageLeftCellId = "articleImageLeftCellId"
    let articleImageRightCellId = "articleImageRightCellId"
    let articleImageTopCellId = "articleImageTopCellId"
    
    var articlesMusic:[Article]?
    var articlesMovies:[Article]?

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
        collectionView.register(ArticleImageLargeCell.self, forCellWithReuseIdentifier: articleImageLargeCellId)
        collectionView.register(ArticleImageLeftCell.self, forCellWithReuseIdentifier: articleImageLeftCellId)
        collectionView.register(ArticleImageRightCell.self, forCellWithReuseIdentifier: articleImageRightCellId)
        collectionView.register(ArticleImageTopCell.self, forCellWithReuseIdentifier: articleImageTopCellId)

        let feedMusic = "\(feedMusicSource)\(version)"
        Feed.downloadData(feedUrl: feedMusic) { articles in
            print("articlesMusic: \(articles)")
            
            self.articlesMusic = articles
            self.collectionView.reloadData()
        }
        
        let feedMovies = "\(feedMoviesSource)\(version)"
        Feed.downloadData(feedUrl: feedMovies) { articles in
            print("articlesMovies: \(articles)")
            
            self.articlesMovies = articles
            self.collectionView.reloadData()
        }
        
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
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 7 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageLargeCellId", for: indexPath) as! ArticleImageLargeCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row
            cell.article = articlesMovies?[groupCellIndex]
            return cell
        }
        
        if indexPath.item % 7 == 1 || indexPath.item % 7 == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageLeftCellId", for: indexPath) as! ArticleImageLeftCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row
            cell.article = articlesMusic?[0]
            return cell
        }
        
        if indexPath.item % 7 == 3 || indexPath.item % 7 == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageRightCellId", for: indexPath) as! ArticleImageRightCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageTopCellId", for: indexPath) as! ArticleImageTopCell
        cell.groupCellIndex = groupCellIndex
        cell.layoutCellIndex = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % 7 == 0 {
            return CGSize(width: frame.width, height: 345)
        }
        
        if indexPath.item % 7 == 1 || indexPath.item % 7 == 2 || indexPath.item % 7 == 3 || indexPath.item % 7 == 4 {
            return CGSize(width: frame.width, height: 120)
        }
        
        return CGSize(width: frame.width/2, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func setupViews(){
        addSubview(collectionView)

        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
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
