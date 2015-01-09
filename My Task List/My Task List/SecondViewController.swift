//
//  SecondViewController.swift
//  My Task List
//
//  Created by Todd Fleeman on 1/4/15.
//  Copyright (c) 2015 Todd Fleeman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    // ! sets a var but doesn't assign it yet
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // events
    @IBAction func btnAddTask_Clicked(sender: UIButton){
        taskMGR.addTask(txtTask.text, desc: txtDesc.text)
        self.view.endEditing(true)
        txtTask.text = ""
        txtDesc.text = ""
        self.tabBarController?.selectedIndex = 0
    }
    
    
    // touch functinos
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    // textfield delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}

