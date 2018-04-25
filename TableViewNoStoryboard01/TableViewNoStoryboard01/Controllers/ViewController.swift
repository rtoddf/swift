// https://www.journaldev.com/14081/ios-tableview-uitableview-storyboard

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var articles:[Article]?
    let cellId = "cellId"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = articles?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
        cell.article = articles?[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = articles?[indexPath.item] else { return }
        showArticleDetail(article: article)
    }
    
    func setupViews(){
        let tableView:UITableView = {
            let tv = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
            tv.backgroundColor = .white
            tv.register(CustomCell.self, forCellReuseIdentifier: cellId)
            return tv
        }()
        
        Article.downloadData{ (articles) in
            self.articles = articles
            tableView.reloadData()
//            print("articles: \(self.articles)")
        }

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    func showArticleDetail(article:Article){
        let detailController = ArticleDetailController()
        detailController.article = article
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}
