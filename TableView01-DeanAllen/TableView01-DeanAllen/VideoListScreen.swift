import UIKit

// https://www.youtube.com/watch?v=FtO5QT2D_H8&list=PL8seg1JPkqgFQQI7skvLoDeSv0vQ_IM5Q
// https://www.youtube.com/watch?v=gN3FbNJ6_TY&list=PL8seg1JPkqgG3822Pbf_H9xldrODNV3XI&index=9 - pass data
// this is the controller for the tableview
class VideoListScreen: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var videos:[Video] = []
    let segueIndentifier:String = "MasterToDetail"
    let cellIdentifier:String = "VideoCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        videos = Video.createArray()
        
        // set the IBOutlet and set the delegate and datasource to self
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIndentifier {
            let destVC = segue.destination as! DetailViewController
            
            destVC.video = sender as? Video
        }
    }
}

// extension for add datasource and delegate protocols to the tableview 
extension VideoListScreen: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! VideoCellTableViewCell
        
        cell.setVideo(video: video)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = videos[indexPath.row]
        performSegue(withIdentifier: segueIndentifier, sender: video)
    }
}




















