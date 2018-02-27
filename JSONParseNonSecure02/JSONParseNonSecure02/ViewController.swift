import UIKit

struct Feed: Decodable {
    let categories:[Category]?
}

struct Category:Decodable {
    let name:String?
    let description:String?
    let people:[Person]?
    
    static func downloadData(completion: @escaping ([Category]) -> Void
        ){
//        var peopleCategories = [Category]()
        let urlString = "http://www.rtodd.net/swift/data/apps06.json"
        let url = URL(string: urlString)
        
        if let urlObject = url {
            URLSession.shared.dataTask(with: urlObject) { (data, response, error) in
                guard let data = data else { return }
            
                do {
                    let feed = try JSONDecoder().decode(Feed.self, from: data)
                    
                    guard let categories = feed.categories else { return }
//                    peopleCategories = categories
                    
                    DispatchQueue.main.async {
                        completion(categories)
                    }
                    
                } catch let jsonErr {
                    print("we got an error \(jsonErr)")
                }

            }.resume()
        }
    }
}

struct Person:Decodable {
    let name:String?
    let short_bio:String?
    let birth_date:String?
    let imageName:String?
}

class ViewController: UIViewController {
    
    var peopleCategories:[Category]?

    override func viewDidLoad() {
        super.viewDidLoad()
//        Category.downloadData { [weak self] (returnedCategories) in
//            guard let strongSelf = self else { return }
//            strongSelf.categories = returnedCategories
//        }
        
        Category.downloadData { (categories) in
            self.peopleCategories = categories
            // this is where you'd do self.collectionView.reloadData()
            print("categories inside: \(self.peopleCategories)")
        }
        
        print("categories outside: \(self.peopleCategories)")
    }
    
    
}

