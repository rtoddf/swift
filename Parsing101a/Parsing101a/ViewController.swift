import UIKit

struct Feed:Decodable {
    let name:String?
    let description:String?
    let people:[Person]?
}

struct Person:Decodable {
    let name:String?
    let info:String?
    let date:String?
    let imageName:String?
}

var people = [Person]()

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var completionHandler: ([Person]) -> Void
        
        parseJSON(completionHandler: {result in
            print(result.count)
        })
        
        print("something: \(something)")
    }
}

func parseJSON(completionHandler: @escaping (([Person]) -> Void)){
    let urlString = "http://rtodd.net/swift/data/apps05.json"
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, err) in
        // check error
        
        guard let data = data else { return }
        //            let dataAsString = String(data: data, encoding: .utf8)
        
        do {
            //                let urlString = "http://rtodd.net/swift/data/apps03.json"
            //                let person = try JSONDecoder().decode(Person.self, from: data)
            //                print(person)
            
            //                let urlString = "http://rtodd.net/swift/data/apps04.json"
            //                let people = try JSONDecoder().decode([Person].self, from: data)
            //                print(people)
            
            //                let urlString = "http://rtodd.net/swift/data/apps05.json"
            let feed = try JSONDecoder().decode(Feed.self, from: data)
            
            guard let peeps = feed.people else { return }
            
            completionHandler(peeps)
        } catch let jsonErr {
            print(jsonErr)
        }

        print("done")
        
        //            DispatchQueue.main.async {
        //                self.view.reloadData()
        //            }
        
        }.resume()
}

