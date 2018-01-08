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
                    let article = Item(
                        title: item.title,
                        short_title: item.short_title,
                        link: item.link,
                        author: item.author,
                        summary: item.summary,
                        item_class: item.item_class,
                        pub_date: item.pub_date?.toDateString(inputDateFormat: "EE, dd MMM YYYY HH:mm:ss z", ouputDateFormat: "hh:mm a EEEE, MMMM dd, YYYY"))
                    articles.append(article)
                }
                
                self.setUpTableView(articles)
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            
            }.resume()
    }
    
    func setUpTableView(_ articles:[Item]) {
        print(type(of: articles))
        print(articles.count)
        
        for article in articles {
            print(article)
            print("---------")
        }
    }
}

// for reference: http://nsdateformatter.com/
extension String {
    func toDateString( inputDateFormat inputFormat  : String,  ouputDateFormat outputFormat  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date!)
    }
}

