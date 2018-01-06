import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    //this is the var that will be used once it's recieved
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }

    func setUI() {
        detailImageView.image = video?.image
        detailTitleLabel.text = video?.title
        detailDescriptionLabel.text = video?.description
    }
    
    @IBAction func watchButton(_ sender: Any) {
    }

}
