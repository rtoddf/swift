import UIKit

struct WebsiteDescription: Decodable {
    let name:String
    let description:String
    let courses:[Course]
}

struct Course: Decodable {
    let id:Int?
    let name:String?
    let link:String?
    let imageUrl:String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // perhaps check err
            // perhaps check status is 200
            guard let data = data else { return }
            
            do {
                let websiteDescription  = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.name)
                print(websiteDescription.description)
                
                for course in websiteDescription.courses {
                    print("The course id is: ", course.id ?? "")
                    print("The course name is: ", course.name ?? "")
                    print("The course link is: ", course.link ?? "")
                    print("The course imageUrl is: ", course.imageUrl ?? "")
                }
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

