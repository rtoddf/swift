import UIKit
import WebKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var cell: UIView!
    @IBOutlet weak var leadImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var fullTextWebView: WKWebView!

    func setArticle(article: Item) {
        cell.layer.cornerRadius = 16
        cell.layer.masksToBounds = true
        
        headlineLabel.text = article.title
        guard let full_text = article.full_text else { return }
        fullTextWebView.loadHTMLString(full_text.wrapHTML(), baseURL: nil)
        
        var imageUrl:String = ""
        
        if article.images != nil {
            imageUrl = article.images![0].url!
        } else if article.videos != nil {
            imageUrl = article.videos![0].image.url!
        } else {
            imageUrl = "https://www.whio.com/assets/images/whio-placeholder.png"
        }
        
        leadImageView.loadImageUsingUrlString(imageUrl: imageUrl)
    }
    
}
