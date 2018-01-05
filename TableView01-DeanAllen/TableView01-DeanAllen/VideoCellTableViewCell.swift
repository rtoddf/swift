import UIKit

// this should be VideoCell
// this is the controller for hte cell  
class VideoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var vieoTitleLabel: UILabel!
    
    func setVideo(video:Video) {
        videoImageView.image = video.image
        vieoTitleLabel.text = video.title
    }
}
