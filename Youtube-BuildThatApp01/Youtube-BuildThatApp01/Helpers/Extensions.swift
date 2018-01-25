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

extension UIImageView {
    func loadImageUsingUrlString(urlString:String) {
        let url = URL(string: urlString)
        guard let imageUrl = url else { return }
        let request = URLRequest(url: imageUrl)
        URLSession.shared.dataTask(with: request) { (data, respone, error) in
            if error != nil {
                print(error as Any)
                return
            }
            
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
            
            }.resume()
    }
}
