import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleThumbnailImage: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    func setArticle(article: Item) {
        articleTitleLabel.text = article.title
//        articleThumbnailImage.image = UIImage(
        
//        print("article images: \(article.images)")
//        print("article videos: \(article.videos)")
//        
//        for image in article.images! {
//            print("image url: \(image.url)")
//        }
//        
//        for video in article.videos! {
//            print("video url: \(video.url)")
//        }
        
//        var articleThumb:String?
        
//        if
    }
}
