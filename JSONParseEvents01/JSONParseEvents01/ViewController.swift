import UIKit

struct EventFeedDescription: Decodable {
    let api_version:String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonUrlString = "https://staging.k923orlando.com/api/eventful-no-callback?callback=EventCallback&include=tickets&show_tickets=1&app_key=c8D6Z2pDmt3Pfg7s&api_token=da55a4a4bd36478372dc17090ed99ac2&q=K92.3%2BBest%2BBets&sort_by=date&w=2018010310-2018020210&page_size=4&image_size=blackborder250&ehp_tag=&SiteUrl=http%3A%2F%2Fevents.k923orlando.com&ApiUrl=%2Fapi%2Fv1%2Fevents%2F&ApiMethod=search"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // take care of responses and err
            guard let data = data else { return }
            
            do {
                let feedDescription  = try JSONDecoder().decode(EventFeedDescription.self, from: data)
                print("the feed user is: ", feedDescription.api_version ?? "")
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

