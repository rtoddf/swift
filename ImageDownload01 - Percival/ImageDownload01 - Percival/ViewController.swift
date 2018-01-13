import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageUrl:String = "https://www.whio.com/rf/image_lowres/Pub/p9/JournalNews/2018/01/11/Images/newsEngin.20935433_Jocelyn-Bucaro.jpg"
        
        getWebImage(imageUrl)
        
//        swift 4 return a uiimage from function
//        https://stackoverflow.com/questions/31608302/return-value-from-completion-handler-swift/31608684
        
//        var theimage:UIImage = getWebImage(imageUrl)
        
        // restores from memory if downloaded
//        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        if documentsPath.count > 0 {
//            let documentsDirectory = documentsPath[0]
//
//            if let savedImageName = savedImageName {
//                let restorePath = documentsDirectory + savedImageName
//                imageView.image = UIImage(contentsOfFile: restorePath)
//            }
//        }
        
        // downloads the image the first time
//        let url = URL(string: imageUrl)!
//        let request = NSMutableURLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {
//            data, response, error in
//
//            if error != nil {
//                print(error as Any)
//            } else {
//                if let data = data {
//                    if let image = UIImage(data: data) {
//                        DispatchQueue.main.async { // Correct - https://developer.apple.com/documentation/code_diagnostics/main_thread_checker
//                            self.imageView.image = image
//
//                            // searches for documents path
//                            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//                            // should return one, but we just make sure
//                            if documentsPath.count > 0 {
//                                if let savedImageName = savedImageName {
//                                    let documentsDirectory = documentsPath[0]
//                                    let savePath = documentsDirectory + savedImageName
//
//                                    do {
//                                        try UIImageJPEGRepresentation(image, 1)?.write(to: URL(fileURLWithPath: savePath))
//                                    } catch {
//                                        // process the error
//                                    }
//
//                                    // another way
//                                    // FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//
//        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getWebImage(_ imageUrl:String) {
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
                imageView.image = UIImage(contentsOfFile: restorePath)
            }
        }
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error as Any)
            } else {
                if let data = data {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async { // Correct - https://developer.apple.com/documentation/code_diagnostics/main_thread_checker
                            self.imageView.image = image
                            
                            print(type(of: image))
                            
//                            return image
                            
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

