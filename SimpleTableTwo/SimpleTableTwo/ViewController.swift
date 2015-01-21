//
//  ViewController.swift
//  SimpleTableTwo
//
//  Created by Todd Fleeman on 1/20/15.
//  Copyright (c) 2015 Todd Fleeman. All rights reserved.
//

import UIKit

class CandyViewController: UITableViewController {
    
    var Candies = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Candies = ["Snickers", "Baby Ruth"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Candies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = Candies[indexPath.row]
        
        return cell
    }


}

