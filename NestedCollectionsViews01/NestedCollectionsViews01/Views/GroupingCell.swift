import UIKit

class GroupingCell:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let feedMusicSource = "reviews-music"
    let feedMoviesSource = "reviews-movies"
    let feedPlacesSource = "reviews-places"
    let version = ""
    let menuFeed = "http://rtodd.net/swift/data/menu-music.json"
    
    let articleImageLargeCellId = "articleImageLargeCellId"
    let articleImageLeftCellId = "articleImageLeftCellId"
    let articleImageRightCellId = "articleImageRightCellId"
    let articleImageTopCellId = "articleImageTopCellId"
    
    var articlesMusic:[Article]?
    var articlesMovies:[Article]?
    var articlesPlaces:[Article]?
    var events:[Event]?

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
            self.articlesMusic = articles
            self.collectionView.reloadData()
        }
        
        let feedMovies = "\(feedMoviesSource)\(version)"
        Feed.downloadData(feedUrl: feedMovies) { articles in
            self.articlesMovies = articles
            self.collectionView.reloadData()
        }
        
        let feedPlaces = "\(feedPlacesSource)\(version)"
        Feed.downloadData(feedUrl: feedPlaces) { articles in
            self.articlesPlaces = articles
            self.collectionView.reloadData()
        }
        
        let feedBase = "https://dayton.pointslocal.com/api/v1/events?"
        let date_format = "F%20j,%20Y"
        let time_format = "g:i%20a"
        let search = "festival"
        let tag = ""
        let category = ""
        let latitude = "39.7794694"
        let longitude = "-84.2721968"
        let radius = "25"
        let start = "today"
        let end = "+30%20days"
        let count = "14"
        
        let feedEvents = "\(feedBase)date_format=\(date_format)&time_format=\(time_format)&search=\(search)&tag=\(tag)&category=\(category)&latitude=\(latitude)&longitude=\(longitude)&radius=\(radius)&start=\(start)&end=\(end)&count=\(count)"
        
        Events.downloadData(feedUrl: feedEvents) { (events) in
            self.events = events
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
        
        if indexPath.item % 7 == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageLeftCellId", for: indexPath) as! ArticleImageLeftCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row

            let cellIndex = (2 * groupCellIndex) + 0
            cell.article = articlesMusic?[cellIndex]
            return cell
        }
        
        if indexPath.item % 7 == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageLeftCellId", for: indexPath) as! ArticleImageLeftCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row
            
            let cellIndex = (2 * groupCellIndex) + 1
            cell.article = articlesMusic?[cellIndex]
            return cell
        }
        
        if indexPath.item % 7 == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageRightCellId", for: indexPath) as! ArticleImageRightCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row

            let cellIndex = (2 * groupCellIndex) + 0

            cell.article = articlesPlaces?[cellIndex]
            return cell
        }
        
        if indexPath.item % 7 == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageRightCellId", for: indexPath) as! ArticleImageRightCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row
            
            let cellIndex = (2 * groupCellIndex) + 1
            cell.article = articlesPlaces?[cellIndex]
            return cell
        }
        
        if indexPath.item % 7 == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageTopCellId", for: indexPath) as! ArticleImageTopCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row
            
            print("events: \(events)")
            
            let cellIndex = (2 * groupCellIndex) + 0
            cell.event = events?[cellIndex]
            return cell
        }
        
        if indexPath.item % 7 == 6 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageTopCellId", for: indexPath) as! ArticleImageTopCell
            cell.groupCellIndex = groupCellIndex
            cell.layoutCellIndex = indexPath.row
            
            let cellIndex = (2 * groupCellIndex) + 1
            cell.event = events?[cellIndex]
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageTopCellId", for: indexPath) as! ArticleImageTopCell
        cell.groupCellIndex = groupCellIndex
        cell.layoutCellIndex = indexPath.row
        
        let cellIndex = (2 * groupCellIndex) + 0
        cell.event = events?[cellIndex]
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
