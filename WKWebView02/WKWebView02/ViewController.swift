import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupWebView()
    }
    
    let webView:WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        
        let url = URL(string: "https://www.youtube.com/")
        let request = URLRequest(url: url!)
        wv.load(request)
        
        return wv
    }()
    
    func setupWebView(){
        view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        webView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }

}

