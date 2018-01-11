import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageUrl:String = "https://cdn1.thr.com/sites/default/files/imagecache/landscape_928x523/2017/11/tommyd.jpg"
        let imageNameSplit = imageUrl.components(separatedBy: "/")
        let savedImageName = imageNameSplit.last
        
        // restores from memory if downloaded
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if documentsPath.count > 0 {
            let documentsDirectory = documentsPath[0]
            
            if let savedImageName = savedImageName {
                let restorePath = documentsDirectory + savedImageName
                imageView.image = UIImage(contentsOfFile: restorePath)
            }
        }
        
        // downloads the image the first time
        let url = URL(string: imageUrl)!
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error as Any)
            } else {
                if let data = data {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async { // Correct - https://developer.apple.com/documentation/code_diagnostics/main_thread_checker
                            self.imageView.image = image
                            
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
                                }
                            }
                        }
                    }
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

