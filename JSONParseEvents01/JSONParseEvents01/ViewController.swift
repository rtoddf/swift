import UIKit

enum ImageSize {
    case blackborder250
    /*
        some image sizes available
        blackborder250    (250 x 250)
        blackborder500    (500 x 500)
        block250    (250 x 250)
        block67        (67 x 67)
        large        (480 x 480)
    */
}

struct EventFeedDescription: Decodable {
    let api_version:String?
    let api_results:ApiResults
}

struct ApiResults: Decodable {
    let user:String?
    let page_size:String?
    let events:[Event]
}

struct Event: Decodable {
    let title:String?
    let venue_name:String?
    let time_string:String?
    let start_time:String?
    let stop_time:String?
    let image:String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api_key:String = "c8D6Z2pDmt3Pfg7s"
        let api_token:String = "da55a4a4bd36478372dc17090ed99ac2"
        let sort_by:String = "date"
        let query_start_date:String = "2018010310"
        let query_end_date:String = "2018060210"
        let page_size:Int = 25
        let image_size:String = "blackborder250"
        let site_url:String = "http%3A%2F%2Fevents.k923orlando.com"
        
        
        
        let jsonUrlString = getApiEndpoint(forApiKey: api_key, forApiToken: api_token, sortBy:sort_by, startDate: query_start_date, endDate: query_end_date, forNumberOfResults: page_size, withImageSize: image_size, withSiteUrl: site_url)
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // take care of responses and err
            guard let data = data else { return }
            
            do {
                let feedDescription  = try JSONDecoder().decode(EventFeedDescription.self, from: data)
//                print("User: ", feedDescription.api_results.user ?? "")
//                print("Page size: ", feedDescription.api_results.page_size ?? "")
                
                for event in feedDescription.api_results.events {
                    print("Event title: ", event.title ?? "")
                    print("@", event.venue_name ?? "")
                    
                    // can this be moved to the struct??
                    let startTime = event.start_time
                    let startTimeFormatted = startTime?.toDateString(inputDateFormat: "yyyy-MM-dd HH:mm:ss", ouputDateFormat: "EE'.' MM/dd ha")
                    let stopTime = event.stop_time
                    let stopTimeFormatted = stopTime?.toDateString(inputDateFormat: "yyyy-MM-dd HH:mm:ss", ouputDateFormat: "EE'.' MM/dd ha")
                    let eventImageString = event.image
                    let eventImage = eventImageString?.replacingOccurrences(of: "//", with: "http://")
                    
                    print("Start Time", startTimeFormatted ?? "")
                    print("Stop Time", stopTimeFormatted ?? "")
                    print("Event image: ", eventImage ?? "")
                    print("-------------------------------")
                }
                
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getApiEndpoint(forApiKey apiKey:String, forApiToken apiToken:String, sortBy sort:String, startDate forStartDate:String, endDate toEndDate:String, forNumberOfResults pageSize:Int, withImageSize imageSize:String, withSiteUrl siteUrl:String) -> String {
        let endpoint:String = "https://staging.k923orlando.com/api/eventful-no-callback?callback=EventCallback&include=tickets&show_tickets=1&app_key=\(apiKey)&api_token=\(apiToken)&q=K92.3%2BBest%2BBets&sort_by=\(sort)&w=\(forStartDate)-\(toEndDate)&page_size=" + String(pageSize) + "&image_size=\(imageSize)&ehp_tag=&SiteUrl=\(siteUrl)&ApiUrl=%2Fapi%2Fv1%2Fevents%2F&ApiMethod=search"
        return endpoint
        
        // https://staging.k923orlando.com/api/eventful-no-callback?callback=EventCallback&include=tickets&show_tickets=1&app_key=c8D6Z2pDmt3Pfg7s&api_token=da55a4a4bd36478372dc17090ed99ac2&q=K92.3%2BBest%2BBets&sort_by=date&w=2018010310-2018060210&page_size=25&image_size=blackborder250&ehp_tag=&SiteUrl=http%3A%2F%2Fevents.k923orlando.com&ApiUrl=%2Fapi%2Fv1%2Fevents%2F&ApiMethod=search
    }
}

extension String {
    func toDateString( inputDateFormat inputFormat  : String,  ouputDateFormat outputFormat  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date!)
    }
}
