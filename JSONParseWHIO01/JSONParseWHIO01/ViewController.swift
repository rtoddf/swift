import UIKit

struct ApiResults: Decodable {
    let version:String?
    let lastBuildDate:String?
    let channel:Channel
}

struct Channel: Decodable {
    let title:String?
    let link:String?
    let source:String?
    let item:[Item]
}

struct Item: Decodable {
    let title:String?
    let short_title:String?
    let link:String?
    let author:String?
    let summary:String?
    let item_class: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://www.whio.com/feed?id=0face55a-4cf7-11e6-8f16-4a55d4f1e287&count=10"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // take care of reponses and err
            
            guard let data = data else { return }
            do {
                let feed = try JSONDecoder().decode(ApiResults.self, from: data)
                
                print(feed.version ?? "")
                print(feed.lastBuildDate ?? "")
                print("----------------------")
                print(feed.channel.title ?? "")
                print(feed.channel.link ?? "")
                print(feed.channel.source ?? "")
                print("----------------------")
                
                for item in feed.channel.item {
                    print("title: \(item.title ?? "") ")
                    print("short title: \(item.short_title ?? "") ")
                    print("link: \(item.link ?? "") ")
                    print("author: \(item.author ?? "") ")
                    print("summary: \(item.summary ?? "") ")
                    print("item class: \(item.item_class ?? "") ")
                }
                
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

