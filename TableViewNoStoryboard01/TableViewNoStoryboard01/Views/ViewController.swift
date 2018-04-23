import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableData = ["Beach", "Clubs", "Chill", "Dance"]
    let cellId = "cellId"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
        let text = tableData[indexPath.row]
        cell.nameLabel.text = text
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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

        view.addSubview(tableView)
    }
}

class CustomCell:UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Label text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.text = "Label text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": descriptionLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-4-[v1]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": descriptionLabel]))
    }
}

