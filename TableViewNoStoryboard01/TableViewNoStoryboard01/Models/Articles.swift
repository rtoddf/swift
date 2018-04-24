import UIKit

struct Article:Decodable {
    let headline:String?
    
    static func downloadData(completion: @escaping ([Article]) -> Void) {
        let urlString = "http://rtodd.net/swift/data/personalities02.json"
        let url = URL(string: urlString)
        
        if let urlObject = url {
            URLSession.shared.dataTask(with: urlObject) { (data, response, error) in
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let articles = try decoder.decode([Article].self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(articles)
                    }
                } catch let jsonErr {
                    print("we got an error \(jsonErr)")
                }
                
            }.resume()
        }
    }
}
