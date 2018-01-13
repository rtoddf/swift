import Foundation
import UIKit

struct Results: Decodable {
    let version:String?
    let lastBuildDate:String?
    let channel:Channel
}

struct Channel: Decodable {
    let title:String?
    let link:String?
    let source:String?
//    let item:[Item]
}
