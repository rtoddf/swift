import UIKit

struct Rectangle {
    var width = 1
    var height = 1
    
    mutating func scaleBy(value: Int) {
        width *= value
        height *= value
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        var area = Rectangle(width: 100, height: 100)
        print(area)
        area.scaleBy(value: 2)
        print(area)
    }
}

