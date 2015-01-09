import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tblTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // update the list when returned to view
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData()
    }
    
    // delete functionality
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            taskMGR.tasks.removeAtIndex(indexPath.row)
            tblTasks.reloadData()
        }
    }

    // uitableviewdatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskMGR.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        
        cell.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.2)
        
        cell.textLabel?.text = taskMGR.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMGR.tasks[indexPath.row].desc
        
//        cell.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.2)
        
        return cell
    }


}

