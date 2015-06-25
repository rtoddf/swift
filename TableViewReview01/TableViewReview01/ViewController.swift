import UIKit

class TableViewController: UITableViewController {
    
    var candies = [Candy]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.candies = [
            Candy(name: "Jolly Rancher"),
            Candy(name: "Snickers"),
            Candy(name: "Twix"),
            Candy(name: "Butterfinger"),
            Candy(name: "Mily Way")
        ]
     
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.candies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var candy : Candy
        candy = candies[indexPath.row]
        cell.textLabel?.text = candy.name
        
        return cell
    }
    
}

