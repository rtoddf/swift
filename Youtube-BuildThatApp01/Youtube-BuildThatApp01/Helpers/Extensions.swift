import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(format:String, views:UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        //        ["v0": thumbnailImageView, "v1": separatorView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView:UIImageView {
    var imageUrlString:String?
    
    func loadImageUsingUrlString(urlString:String) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        guard let imageUrl = url else { return }
        let request = URLRequest(url: imageUrl)
        URLSession.shared.dataTask(with: request) { (data, respone, error) in
            if error != nil {
                print(error as Any)
                return
            }
            
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: imageData)
                guard let imgToCache = imageToCache else { return }
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imgToCache, forKey: urlString as AnyObject)
            }
            
            }.resume()
    }
}
