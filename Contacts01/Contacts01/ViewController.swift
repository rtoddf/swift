import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    let names = [
        ["Todd", "Larry", "Manny", "Marcie", "Katie", "Dan", "Wendy"],
        ["Bob", "Margie", "Chris"],
        ["Mark", "Kyle"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "header"
        label.backgroundColor = .orange
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name = names[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(name) Section: \(indexPath.section) Row: \(indexPath.row)"
        return cell
    }

}

