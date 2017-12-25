import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let data:[[String]] = [
        ["Item One", "Item Two", "Item Three"],
        ["Item A", "Item B", "Item C", "Item D"]
    ]
    
    let subs:[[String]] = [
        ["Sub One", "Sub Two", "Sub Three"],
        ["Sub A", "Sub B", "Sub C", "Sub D"]
    ]
    
    let images:[[String]] = [
        ["groff", "garfield", "groff"],
        ["groff", "garfield", "groff", "garfield"]
    ]
    
    let colors:[[UIColor]] = [
        [.red, .red, .red],
        [.green, .green, .blue, .blue]
    ]
    
    let titles:[String] = ["Numbers", "Letters"]
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    // each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = UITableViewCell()
        // recycle tableviewcells
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.detailTextLabel?.text = subs[indexPath.section][indexPath.row]
        cell.imageView?.image = UIImage(named: images[indexPath.section][indexPath.row])
//        cell.imageView?.image = UIImage(named: "star")
        // add colors
//        cell.imageView?.image = UIImage(named: "star")?.withRenderingMode(.alwaysTemplate)
//        cell.imageView?.tintColor = colors[indexPath.section][indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

