//
//  ViewController.swift
//  JSONParseSwift4Simple01
//
//  Created by Todd Fleeman on 1/2/18.
//  Copyright © 2018 Todd Fleeman. All rights reserved.
/*
 https://www.youtube.com/watch?v=YY3bTxgxWss&list=WL&index=54 - tutorial on Youtube
 Completed Source Code: https://www.letsbuildthatapp.com/course_video?id=1562
 */

import UIKit


struct WebsiteDescription: Decodable {
    let name:String
    let description:String
    let courses: [Course]
}

//struct Course {
// decodable protocol
// what if json is missing a field??? - use optionals - ?
struct Course: Decodable {
    let id:Int?
    let name:String?
    let link:String?
    let imageUrl:String?
    
    // not needed when using decoder
//    init(json: [String:Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
// https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // perhaps check err
            // perhaps check status is 200
            
            guard let data = data else { return }
            
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)

            do {
//                let course = try JSONDecoder().decode(Course.self, from: data)
//                print(course.name)
                
                // array of courses
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                print(courses)
                
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.name)
                print(websiteDescription.description)
                
                for course in websiteDescription.courses {
                    print("The course id is: ", course.id ?? "")
                    print("The course name is: ", course.name ?? "")
                    print("The course link is: ", course.link ?? "")
                    print("The course imageUrl is: ", course.imageUrl ?? "")
                }
                // old way - gives serialized json - swift 2/3/obj-c
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
//                let course = Course(json: json)
//
//                print(course)
            } catch let jsonErr {
                print("error serilaizing json:" , jsonErr)
            }
            
            
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

