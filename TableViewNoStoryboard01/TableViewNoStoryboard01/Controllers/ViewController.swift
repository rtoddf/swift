import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableData = ["Beach", "Clubs", "Chill", "Dance"]
    var articles:[Article]?
    let cellId = "cellId"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
//        let text = tableData[indexPath.row]
//        cell.nameLabel.text = text
        cell.article = articles?[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        Article.downloadData{ (articles) in
            self.articles = articles
            
            print("articles: \(self.articles)")
        }
        
    }
    
    func setupViews(){
        let tableView:UITableView = {
            let tv = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
            tv.backgroundColor = .white
            tv.register(CustomCell.self, forCellReuseIdentifier: cellId)
            return tv
        }()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()

        view.addSubview(tableView)
    }
}
