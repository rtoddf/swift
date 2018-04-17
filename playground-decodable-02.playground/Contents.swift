import Foundation
import XCPlayground

struct Article:Decodable {
    let headline:String?
}

func downloadData(){
    let urlString = "http://rtodd.net/swift/data/movie-reviews.json"
    let url = URL(string: urlString)
    
    if let urlObject = url {
        
        URLSession.shared.dataTask(with: urlObject) { (data, response, error) in
            guard let data = data else { return }
            
            print("data: \(data)")
//
//            do {
//                let articles = try JSONDecoder().decode([Article].self, from: data)
//
//                print("articles: ")
//
//            } catch let jsonError {
//                print("we got an error: \(jsonError)")
//            }
        }.resume()
        
    }
    
    
}

downloadData()
