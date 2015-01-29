//
//  ViewController.swift
//  DateCalc01
//
//  Created by Todd Fleeman on 1/28/15.
//  Copyright (c) 2015 Todd Fleeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ! is for adding something that will be set, but isn't yet
    var dateCalc: DateCalculator!

    @IBOutlet weak var resultsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        dateCalc = DateCalculator()
        dateCalc.hisName = "Brian"
        dateCalc.hisAge = 40
        
        
    }

    @IBAction func calcTapped(sender: AnyObject) {
        let shouldDate = dateCalc.shouldHeDateIfHisAgeIs(24)
        
        if shouldDate {
            resultsLabel.text = "he should date"
        } else {
            resultsLabel.text = "he should not date"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

