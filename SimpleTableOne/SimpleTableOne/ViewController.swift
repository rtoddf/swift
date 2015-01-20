//
//  ViewController.swift
//  SimpleTableOne
//
//  Created by Todd Fleeman on 1/20/15.
//  Copyright (c) 2015 Todd Fleeman. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Array = ["First", "Second"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        Cell.textLabel?.text = Array[indexPath.row]
        
        return Cell
    }

}

