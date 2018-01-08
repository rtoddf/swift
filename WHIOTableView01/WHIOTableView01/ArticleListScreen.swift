import UIKit

class ArticleListScreen: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var articles:[Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        let jsonUrlString = "https://www.whio.com/feed?id=0face55a-4cf7-11e6-8f16-4a55d4f1e287&count=10"
        let url = URL(string: jsonUrlString)

        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            // take care of reponses and err
            
            guard let data = data else { return }
            do {
                let feed = try JSONDecoder().decode(ApiResults.self, from: data)

                for item in feed.channel.item {
//                    print("item: \(item)")
//                    print("images: \(item.images)")
//                    print("----------------------")
//                    print(type(of: item.images))
                    
//                    guard let images = item.images else { return }
//
//                    for image in images {
//                        print("----------------------")
//                        print("url: \(image.url)")
//                        var image_url:String? = image.url
//                    }
                    
//                    let article = Item(title: <#T##String?#>, short_title: <#T##String?#>, link: <#T##String?#>, author: <#T##String?#>, summary: <#T##String?#>, item_class: <#T##String?#>, pub_date: <#T##String?#>, images: <#T##[Images]?#>, videos: <#T##[Videos]?#>)
                    
                    let article = Item(
                        title: item.title,
                        short_title: item.short_title,
                        link: item.link,
                        author: item.author,
                        summary: item.summary,
                        item_class: item.item_class,
                        pub_date: item.pub_date?.toDateString(inputDateFormat: "EE, dd MMM YYYY HH:mm:ss z", ouputDateFormat: "hh:mm a EEEE, MMMM dd, YYYY"),
                        images: item.images,
                        videos: item.videos)
                    self.articles.append(article)
                }

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            
        }.resume()
        
//        print("articles count: \(articles.count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ArticleListScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let cellIndentifier:String = "ArticleCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier) as! ArticleCell
        cell.setArticle(article: article)

        return cell
    }
}

extension String {
    func toDateString( inputDateFormat inputFormat  : String,  ouputDateFormat outputFormat  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date!)
    }
}
