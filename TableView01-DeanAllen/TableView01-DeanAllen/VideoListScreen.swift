import UIKit

// https://www.youtube.com/watch?v=FtO5QT2D_H8&list=PL8seg1JPkqgFQQI7skvLoDeSv0vQ_IM5Q
// https://www.youtube.com/watch?v=gN3FbNJ6_TY&list=PL8seg1JPkqgG3822Pbf_H9xldrODNV3XI&index=9 - pass data
// this is the controller for the tableview
class VideoListScreen: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var videos:[Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        videos = createArray()
        
        // set the IBOutlet and set the delegate and datasource to self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [Video] {
        var tempVideos:[Video] = []
        
        let video1 = Video(image: #imageLiteral(resourceName: "aaron-rhodes"), title: "Aaron Rhodes")
        let video2 = Video(image: #imageLiteral(resourceName: "matt-bomer"), title: "Matt Bomer")
        let video3 = Video(image: #imageLiteral(resourceName: "nyle-dimarco"), title: "Nyle Dimarco")
        let video4 = Video(image: #imageLiteral(resourceName: "colton-haynes"), title: "Colton Haynes")
        let video5 = Video(image: #imageLiteral(resourceName: "eli-lieb"), title: "Eli Lieb")
        let video6 = Video(image: #imageLiteral(resourceName: "gus-kenworthy"), title: "Gus Kenworthy")
        let video7 = Video(image: #imageLiteral(resourceName: "matt-doyle"), title: "Matt Doyle")
        let video8 = Video(image: #imageLiteral(resourceName: "shaping-sound"), title: "Shaping Sound")
        let video9 = Video(image: #imageLiteral(resourceName: "tom-daley"), title: "Tom Daley")
        
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        tempVideos.append(video6)
        tempVideos.append(video7)
        tempVideos.append(video8)
        tempVideos.append(video9)
        
        return tempVideos
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCellTableViewCell
        
        cell.setVideo(video: video)

        return cell
    }
}
