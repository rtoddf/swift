import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var leadImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    
    func setArticle(article: Item) {
        headlineLabel.text = article.title
        
        var imageUrl:String = ""
        
        if article.images != nil {
            imageUrl = article.images![0].url!
        } else if article.videos != nil {
            imageUrl = article.videos![0].image.url!
//            playButton.image = #imageLiteral(resourceName: "playbutton")
        } else {
            imageUrl = "https://www.whio.com/assets/images/whio-placeholder.png"
        }
        
        leadImageView.loadImageUsingUrlString(imageUrl: imageUrl)
    }
    
}
