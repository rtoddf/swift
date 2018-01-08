import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJSON()
    }

    func downloadJSON(){
        let jsonUrlString = "https://www.whio.com/feed?id=0face55a-4cf7-11e6-8f16-4a55d4f1e287&count=10"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // take care of reponses and err
            
            guard let data = data else { return }
            do {
                let feed = try JSONDecoder().decode(ApiResults.self, from: data)
                var articles = [Item]()
                
                for item in feed.channel.item {
                    let article = Item(title: item.title, short_title: item.short_title, link: item.link, author: item.author, summary: item.summary, item_class: item.item_class)
                    articles.append(article)
                }
                
                self.setUpTableView(articles)
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            
            }.resume()
    }
    
    func setUpTableView(_ articles:[Item]) {
        print(articles)
        print(type(of: articles))
    }
}

