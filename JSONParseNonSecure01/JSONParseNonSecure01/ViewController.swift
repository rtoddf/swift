import UIKit

struct Feed: Decodable {
    let senators:[Senator]
}

struct Senator: Decodable {
//    let title:String?
    let name:String?
    let state:String?
    let party:String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }

    func downloadJSON() {
        
        
        let jsonUrlString = "http://www.rtodd.net/swift/data/senators.json"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            // take care of reponses and err
            
            guard let data = data else { return }
            
            do {
                let senators = try JSONDecoder().decode([Senator].self, from: data)
                
                for senator in senators {
//                    guard let name = senator.name else { return }
//                    guard let state = senator.state else { return }
//                    guard let party = senator.party else { return }
                    
                    if let name = senator.name,
                        let state = senator.state,
                        let party = senator.party {
                        print("\(name) from \(state.uppercased()) is a \(party.capitalizeFirstLetter())")
                    } else {
                        return
                    }
                    
//                    if let title = senator.title {
//                        print("title: \(title)")
//                    } else {
//                        return
//                    }
                    
                    
                }
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            
        }.resume()
    }
    
}

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}


