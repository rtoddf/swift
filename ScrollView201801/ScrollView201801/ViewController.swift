import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var views = [UIView]()
    var imageArray = [UIImage]()
    var textArray = [String]()
    var headlineArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
            setUpScrollView()
        }
        
        func setUpScrollView() {
            imageArray = [UIImage(named: "deborah-harry")!, UIImage(named: "adam-lambert")!, UIImage(named: "ellen-page")!, UIImage(named: "music-brett-kissel")!, UIImage(named: "tyler-oakley")!]
            
            headlineArray = ["Democratic nominee for President", "Chosen as the Democratic nominee", "Headline 3", "Cox retired from public office", "Three-way race gaining 41.5% of the vote"]
            
            textArray = [
                "James Middleton Cox (March 31, 1870 – July 15, 1957) was the 46th and 48th Governor of Ohio, a U.S. Representative from Ohio, and the Democratic nominee for President of the United States in the election of 1920. He founded the chain of newspapers that continues today as Cox Enterprises, a media conglomerate. Born and raised in Ohio, Cox began his career as a newspaper copy reader before becoming an assistant to Congressman Paul J. Sorg. As owner of the Dayton Daily News, Cox introduced several innovations and crusaded against the local Republican Party boss. He served in the United States House of Representatives from 1909 to 1913.",
                "As governor, Cox introduced a series of progressive reforms and supported Woodrow Wilson's handling of World War I and its aftermath. He was chosen as the Democratic nominee for president on the fourth ballot of the 1920 Democratic National Convention. Running on a ticket with Franklin D. Roosevelt, Cox suffered one of the worst defeats in presidential election history as the country accepted Republican nominee Warren G. Harding's call for a 'return to normalcy' after the Wilson years.",
                "Cox retired from public office after the 1920 election to focus on his media conglomerate, which expanded into several cities. By 1939, his media empire extended from Dayton to Miami. He remained active in politics, supporting Roosevelt's campaigns and attending the 1933 London Economic Conference. Cox was born on a farm near the tiny Butler County, Ohio, village of Jacksonburg, the youngest son of Gilbert Cox and Eliza Andrew; he had six siblings. He was educated in a one-room school until the age sixteen.",
                "After his parents divorced, he moved with his mother in 1886 to Middletown, Ohio, where he started a journalistic apprenticeship at the Middletown Weekly Signal published by John Q. Baker. In 1892 he received a job at the Cincinnati Enquirer as a copy reader on the telegraph desk, and later started to report on spot news including the railroad news. In 1908, he ran for Congress as a Democrat and was elected. Cox represented Ohio in the United States House of Representatives from 1909 to 1913, and resigned after winning election as Governor of Ohio.",
                "As Governor of Ohio, in a three-way race gaining 41.5% of the vote. Cox served three terms; after winning the 1912 election, he served from 1913 to 1915; he lost reelection in 1914, but won the 1916 and 1918 elections, and served from 1917 to 1921. He presided over a wide range of measures such as laying the foundation of Ohio's unified highway system, creating no fault workers' compensation system and restricting child labor."
            ]
            
            for i in 0..<5 {
                if i == 2 {
                    let xPosition = self.mainScrollView.frame.width * CGFloat(i) + CGFloat(16)
                    
                    // create the view
                    let imgView = UIView()
                    imgView.frame = CGRect(x: 0, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
                    
                    let imageView = UIImageView()
                    imageView.image = imageArray[i]
                    imageView.contentMode = .scaleAspectFit
                    
                    imageView.frame = CGRect(x: xPosition, y: 16, width: self.mainScrollView.frame.width - 32, height: self.mainScrollView.frame.height - 32)
                    
                    imgView.addSubview(imageView)
                    views.append(imgView)
                } else {
                    let xPosition = self.mainScrollView.frame.width * CGFloat(i) + CGFloat(16)
                    
                    // create the view
                    let view = UIView()
                    view.frame = CGRect(x: xPosition, y: 16, width: self.mainScrollView.frame.width - 32, height: self.mainScrollView.frame.height - 32)
                    view.backgroundColor = UIColor.white
                    view.layer.cornerRadius = 20.0
                    
                    
                    let headlineLabel = UILabel()
                    headlineLabel.text  = headlineArray[i]
                    headlineLabel.font = UIFont(name: "Avenir-Medium", size: 16.0)
                    headlineLabel.frame = CGRect(x: 24, y: 16, width: self.mainScrollView.frame.width - 64, height: 20)
                    
                    // create the textview and add the text
                    let textView = UITextView()
                    textView.text  = textArray[i]
                    textView.font = UIFont(name: "Avenir-Light", size: 15.0)
                    textView.textContainerInset = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
                    
                    textView.backgroundColor = UIColor.clear
                    //                textView.layer.cornerRadius = 20.0
                    textView.frame = CGRect(x: 0, y: 16, width: self.mainScrollView.frame.width - 32, height: self.mainScrollView.frame.height - 32)
                    
                    view.addSubview(headlineLabel)
                    view.addSubview(textView)
                    views.append(view)
                }
        }
        
        
        for (i, view) in views.enumerated() {
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
            mainScrollView.addSubview(view)
        }

        func printFonts() {
            let fontFamilyNames = UIFont.familyNames
            for familyName in fontFamilyNames {
                print("------------------------------")
                print("Font Family Name = [\(familyName)]")
                let names = UIFont.fontNames(forFamilyName: familyName )
                print("Font Names = [\(names)]")
            }
        }

        printFonts()
        
//        for i in 0..<textArray.count {
//            let textView = UITextView()
//            textView.text  = textArray[i]
//            textView.font = UIFont(name: "Avenir-Light", size: 15.0)
//            textView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//            textView.backgroundColor = UIColor.white
        
//            let myColor = UIColor.black
//            textView.layer.borderColor = myColor.cgColor
//            
//            textView.layer.borderWidth = 1.0
//            textView.layer.cornerRadius = 20.0
//
//            let xPosition = self.mainScrollView.frame.width * CGFloat(i) + CGFloat(16)
//            textView.frame = CGRect(x: xPosition, y: 16, width: self.mainScrollView.frame.width - 32, height: self.mainScrollView.frame.height - 32)
//
//            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
//            mainScrollView.addSubview(textView)
//        }
        
//        for i in 0..<imageArray.count {
//            let imageView = UIImageView()
//            imageView.image = imageArray[i]
//            imageView.contentMode = .scaleAspectFit
//            let xPosition = self.mainScrollView.frame.width * CGFloat(i)
//
//
//            imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
//
//            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
//            mainScrollView.addSubview(imageView)
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

