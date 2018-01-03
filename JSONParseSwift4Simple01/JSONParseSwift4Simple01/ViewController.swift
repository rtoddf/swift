//
//  ViewController.swift
//  JSONParseSwift4Simple01
//
//  Created by Todd Fleeman on 1/2/18.
//  Copyright © 2018 Todd Fleeman. All rights reserved.
//

import UIKit

struct Course {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // perhaps check err
            // perhaps check status is 200
            
            guard let data = data else { return }
            
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString)
            
        }.resume()
        
//        let myCourse = Course(id: 1, name: "my course", link: "some link", imageUrl: "some image url")
//
//        print(myCourse)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

