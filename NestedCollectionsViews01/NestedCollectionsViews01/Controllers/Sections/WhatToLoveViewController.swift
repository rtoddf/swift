import UIKit

class WhatToLoveViewController:UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let feedMoviesSource = "reviews-movies"
    let version = ""
    
    let articleImageLargeCellId = "articleImageLargeCellId"
    
    var articlesMovies:[Article]?
    
    var menu:Menu? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = menu?.title
        navigationController?.navigationBar.tintColor = .white
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        self.navigationController?.navigationBar.tintColor = .white
        
        let feedMovies = "\(feedMoviesSource)\(version)"
        Feed.downloadData(feedUrl: feedMovies) { articles in
            self.articlesMovies = articles
            self.collectionView?.reloadData()
        }
        
        collectionView?.register(ArticleImageLargeCell.self, forCellWithReuseIdentifier: articleImageLargeCellId)
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = articlesMovies?.count else { return 0 }
        return count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleImageLargeCellId", for: indexPath) as! ArticleImageLargeCell
        cell.article = articlesMovies?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 345)
    }
}
