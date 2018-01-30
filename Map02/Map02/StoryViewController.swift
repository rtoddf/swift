import UIKit
import WebKit

class StoryViewController: UIViewController {
    var article:Item?

    @IBOutlet weak var articleLeadImage: UIImageView!
    @IBOutlet weak var articleHeadlineLabel: UILabel!
    @IBOutlet weak var articlePubDateLabel: UILabel!
    @IBOutlet weak var fullTextWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        articleHeadlineLabel.text = article?.title
        guard let pubdate = article?.pub_date?.toDateString(inputDateFormat: "EE, dd MMM YYYY HH:mm:ss z", ouputDateFormat: "hh:mm a EEEE, MMMM dd, YYYY") else { return }
        articlePubDateLabel.text = "Posted: " + pubdate
        
        guard let full_text = article?.full_text else { return }
        fullTextWebView.loadHTMLString(full_text.wrapHTML(), baseURL: nil)
        
        var imageUrl:String = ""
        
        if article?.images != nil {
            imageUrl = (article?.images![0].url!)!
        } else if article?.videos != nil {
            imageUrl = (article?.videos![0].image.url!)!
//            playButton.image = #imageLiteral(resourceName: "playbutton")
        } else {
            imageUrl = "https://www.whio.com/assets/images/whio-placeholder.png"
        }
        
        articleLeadImage.loadImageUsingUrlString(imageUrl: imageUrl)
    }
}
