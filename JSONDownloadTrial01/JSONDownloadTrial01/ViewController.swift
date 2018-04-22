import UIKit

class ViewController: UIViewController {
    var articles:[Article]?
    
    struct Article:Decodable {
        let headline:String?
        let author:String?
        let summary:String?
        
        let pubDate:String?
        
//        private enum CodingKeys:String, CodingKey {
//            case headline, author, summary
//            case pubDate = "pub_date"
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        downloadData()
    }

    func downloadData(){
        let urlString = "http://rtodd.net/swift/data/movie-reviews.json"
        let url = URL(string: urlString)
        
        if let urlObject = url {
            
            URLSession.shared.dataTask(with: urlObject) { (data, response, error) in
                guard let data = data else { return }
        
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.articles = try decoder.decode([Article].self, from: data)
    
                    print("articles: \(self.articles)")
    
                } catch let jsonError {
                    print("we got an error: \(jsonError)")
                }
            }.resume()
            
        }
        
        
    }

}

