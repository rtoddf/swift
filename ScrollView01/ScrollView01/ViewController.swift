//
//  ViewController.swift
//  ScrollView01
//
//  Created by Todd Fleeman on 5/20/15.
//  Copyright (c) 2015 Todd Fleeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bodyCopy: UILabel!

    @IBOutlet weak var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroller.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)

        self.bodyCopy.textColor = UIColor.orangeColor()
        self.bodyCopy.numberOfLines = 0
        self.bodyCopy.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.bodyCopy.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.scroller.frame = self.view.bounds
        self.scroller.contentSize.height = 400
        self.scroller.contentSize.width = 0
    }
}

