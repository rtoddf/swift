import UIKit

class ArticleViewController: UIViewController {
    @IBOutlet weak var articleLeadImage: UIImageView!
    @IBOutlet weak var articleHeadlineLabel: UILabel!
    @IBOutlet weak var articlePubDateLabel: UILabel!
    @IBOutlet weak var articleAuthorLabel: UILabel!
    
    var article:Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    func setUI() {
        articleHeadlineLabel.text = article?.title
        articlePubDateLabel.text = article?.pub_date
        articleAuthorLabel.text = "By " + (article?.author)!
        
        var imageUrl:String = ""
        
        if article?.images != nil {
            imageUrl = (article?.images![0].url!)!
        } else if article?.videos != nil {
            imageUrl = (article?.videos![0].image.url!)!
//            playButton.image = #imageLiteral(resourceName: "playbutton")
        } else {
            imageUrl = "https://www.whio.com/assets/images/whio-placeholder.png"
        }
        
        let imageNameSplit = imageUrl.components(separatedBy: "/")
        let savedImageName = imageNameSplit.last
        
        let url = URL(string: imageUrl)!
        let request = NSMutableURLRequest(url: url)
        
        // restores from memory if downloaded
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if documentsPath.count > 0 {
            let documentsDirectory = documentsPath[0]
            
            if let savedImageName = savedImageName {
                let restorePath = documentsDirectory + savedImageName
                self.articleLeadImage.image = UIImage(contentsOfFile: restorePath)
            }
        }
        
        // downloads the image the first time
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error as Any)
            } else {
                if let data = data {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async { // Correct - https://developer.apple.com/documentation/code_diagnostics/main_thread_checker
                            self.articleLeadImage.image = image
                            
                            // searches for documents path
                            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                            // should return one, but we just make sure
                            if documentsPath.count > 0 {
                                if let savedImageName = savedImageName {
                                    let documentsDirectory = documentsPath[0]
                                    let savePath = documentsDirectory + savedImageName
                                    
                                    do {
                                        try UIImageJPEGRepresentation(image, 1)?.write(to: URL(fileURLWithPath: savePath))
                                    } catch {
                                        // process the error
                                    }
                                    
                                    // another way
                                    // FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil)
                                }
                            }
                        }
                    }
                }
            }
        }
        task.resume()
    }
}
