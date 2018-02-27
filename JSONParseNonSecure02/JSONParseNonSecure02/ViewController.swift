import UIKit

struct Feed: Decodable {
    let categories:[Category]?
}

struct Category:Decodable {
    let name:String?
    let description:String?
    let people:[Person]?
}

struct Person:Decodable {
    let name:String?
    let short_bio:String?
    let birth_date:String?
    let imageName:String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   var categories = [Category]()

    func downloadData(){
        let urlString = "http://www.rtodd.net/swift/data/apps06.json"
        let url = URL(string: urlString)
        
        guard let urlObject = url else { return }
        
        URLSession.shared.dataTask(with: urlObject) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let feed = try JSONDecoder().decode(Feed.self, from: data)
                
                guard let cats = feed.categories else { return }
                self.categories = cats
                
            } catch let jsonErr {
                print("we got an error")
            }
            
            print(self.categories)
            
        }.resume()
    }
}

