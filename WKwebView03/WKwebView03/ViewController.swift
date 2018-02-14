import UIKit
import WebKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupWebView()
    }
    
    let webView:WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        
        let htmlString = """
        <!DOCTYPE html>
        <html lang="en">
            <head><meta name="viewport" content="width=device-width, user-scalable=no, shrink-to-fit=no"><style type="text/css">body {-webkit-text-size-adjust:none; font-family:-apple-system, BlinkMacSystemFont, sans-serif; width: 100%; word-wrap:break-word; height: auto; margin: 0; padding: 0;} table {width:100%;} img {width: 100%; height: auto;} iframe {width: 100%;height: auto;} .wp-caption[style]{width:100% !important;height:auto;}.wp-caption-text{color:#7a7a7a;font-style:italic;-webkit-text-size-adjust:none;}</style>
                <script src="https://www.whio.com/assets/scripts/lib/jquery-1.10.2.min.js"></script>
            </head>

            <body>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed tortor vitae arcu mollis mollis. Pellentesque volutpat, nibh blandit ultricies convallis, dui lectus pulvinar enim, eget fringilla ex tortor eu velit. Nunc cursus ultricies tortor, eget consequat leo imperdiet egestas.</p>
                <div class="flex-container" data-width="60">
                    <iframe width="360" height="202" src="https://staging.whio.com/weather/cold-monday-warming-trend-place-this-week/WseMc91xawYlvIAwZi79NK/iframe.html" frameborder="0" scrolling="no"></iframe>
                </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed tortor vitae arcu mollis mollis. Pellentesque volutpat, nibh blandit ultricies convallis, dui lectus pulvinar enim, eget fringilla ex tortor eu velit. Nunc cursus ultricies tortor, eget consequat leo imperdiet egestas.</p>
            </body>
        </html>
        """
        wv.loadHTMLString(htmlString, baseURL: nil)
        
//        let url = URL(string: "https://www.youtube.com/")
//        let request = URLRequest(url: url!)
//        wv.load(request)
        
        return wv
    }()
    
    func setupWebView(){
        view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //        webView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
