import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleThumbnailImage: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    func setArticle(article: Item) {
        articleTitleLabel.text = article.title
        
        var imageUrl:String = ""
        
        if article.images != nil {
            imageUrl = article.images![0].url!
        } else if article.videos != nil {
            imageUrl = article.videos![0].image.url!
        } else {
            imageUrl = "we need a placeholder"
            
        }
        
        print("imageUrl: \(imageUrl)")
    }
}
