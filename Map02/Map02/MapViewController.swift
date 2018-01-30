import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var articles:[Item] = []
    let segueIdentifier:String = "MasterToDetail"
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.didReceiveMemoryWarning()
        
        let latitude:CLLocationDegrees = 33.766596
        let longitude:CLLocationDegrees = -84.356305
        
        let latDelta:CLLocationDegrees = 0.025
        let lonDelta:CLLocationDegrees = 0.025
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta:latDelta, longitudeDelta:lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:latitude, longitude:longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center:location, span:span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Jimmy Carter Presidential Library and Museum"
        annotation.subtitle = "The museum includes photographs"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let jsonUrlString = "https://preview-staging.whio.com/feed?id=e7b9cfa6-05e9-11e8-883b-95fa8cdb14f5"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
        
            guard let data = data else { return }
            do {
                let feed = try JSONDecoder().decode(ApiResults.self, from: data)
                self.articles = feed.channel.item
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let jsonErr {
                print("error serializing JSON:", jsonErr)
            }
            
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let destVC = segue.destination as! StoryViewController
            destVC.article = sender as? Item
        }
    }

}

extension MapViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let cellIndentifier:String = "ArticleCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier) as! StoryCell
        cell.setArticle(article: article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        print("article: \(article)")
        performSegue(withIdentifier: segueIdentifier, sender: article)
    }
}
