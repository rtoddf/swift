import UIKit

class ViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var candies = [Candy]()
    var filteredCandies = [Candy]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.candies = [Candy(name: "Jolly Rancher", category: "Candy Bar"),
            Candy(name: "Snickers", category: "Candy Bar"),
            Candy(name: "Twix", category: "Candy Bar"),
            Candy(name: "Butterfinger", category: "Candy Bar"),
            Candy(name: "Milky Way", category: "Candy Bar"),
            Candy(name:"Chocolate Bar", category:"Chocolate"),
            Candy(name:"Dark Chocolate", category:"Chocolate"),
            Candy(name:"Chocolate Chip", category:"Chocolate"),
            Candy(name:"Lollipop", category:"Hard"),
            Candy(name:"Candy Cane", category:"Hard"),
            Candy(name:"Jaw Breaker", category:"Hard"),
            Candy(name:"Caramel", category:"Other"),
            Candy(name:"Sour Chew", category:"Other"),
            Candy(name:"Gummi Bear", category:"Other")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredCandies.count
        } else {
            return self.candies.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var candy: Candy
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            candy  = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        
        cell.textLabel?.text = candy.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchtext(searchText: String, scope: String = "All"){
        // filter the array using the filter method
        self.filteredCandies = self.candies.filter({(candy: Candy) -> Bool in
            var categoryMatch = (scope == "All") || (candy.category == scope)
            var stringMatch = candy.name.rangeOfString(searchText)
            return categoryMatch && (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        let scopes = self.searchDisplayController?.searchBar.scopeButtonTitles as [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        
        self.filterContentForSearchtext(searchString, scope: selectedScope)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
        
        self.filterContentForSearchtext(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("candyDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "candyDetail" {
            let ViewController = segue.destinationViewController as UIViewController
            if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let destinationTitle = self.filteredCandies[indexPath.row].name
                ViewController.title = destinationTitle
            } else {
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let destinationTitle = self.candies[indexPath.row].name
                ViewController.title = destinationTitle
            }
        }
    }
    
    
}

