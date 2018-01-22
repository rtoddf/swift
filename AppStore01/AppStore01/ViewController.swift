import UIKit

//Swift: Recreating AppStore - Horizontal Scroll Direction UICollectionView (Ep 1)
//https://www.youtube.com/watch?v=Ko9oNhlTwH0 - DONE
//
//Swift: AppStore - Integrating REST API, JSON, and Model Objects (Ep 2)
//https://www.youtube.com/watch?v=uLb8cs11h_g - 20:54

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
    var appCategories:[AppCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appCategories = AppCategory.sampleAppCategories()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }

}
