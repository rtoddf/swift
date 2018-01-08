import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleThumbnailImage: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    func setArticle(article: Item) {
        articleTitleLabel.text = article.title
    }
}
