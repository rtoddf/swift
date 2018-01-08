import Foundation

struct ApiResults: Decodable {
    let version:String?
    let lastBuildDate:String?
    let channel:Channel
}

struct Channel: Decodable {
    let title:String?
    let link:String?
    let source:String?
    let item:[Item]
}

struct Item: Decodable {
    let title:String?
    let short_title:String?
    let link:String?
    let author:String?
    let summary:String?
    let item_class:String?
    let pub_date:String?
//    let images:[Images]
}

//struct Images: Decodable {
//    let url:String?
//}

