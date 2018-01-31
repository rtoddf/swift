import UIKit

class MapViewController: UIViewController {
    var articles:[Item] = []
    let segueIdentifier:String = "MasterToDetail"

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let jsonUrlString = "https://preview-staging.whio.com/feed?id=e7b9cfa6-05e9-11e8-883b-95fa8cdb14f5"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
        
            guard let data = data else { return }
            do {
                let feed = try JSONDecoder().decode(ApiResults.self, from: data)
                self.articles = feed.channel.item
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let destVC = segue.destination as! StoryViewController
            destVC.article = sender as? Item
        }
    }

}

extension MapViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let cellIndentifier:String = "ArticleCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier) as! StoryCell
        cell.setArticle(article: article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        print("article: \(article)")
        performSegue(withIdentifier: segueIdentifier, sender: article)
    }
}
