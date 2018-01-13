import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://www.whio.com/feed?id=0face55a-4cf7-11e6-8f16-4a55d4f1e287&count=10"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            

            guard let data = data else { return }
            do {
                let feed = try JSONDecoder().decode(Results.self, from: data)
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            
        }
        .resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

