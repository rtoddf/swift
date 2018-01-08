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
    let item_class: String?
}

//class ApiResults: Decodable {
//    let version:String?
//    let lastBuildDate:String?
//    let channel:[Channel]
//
//    init(version:String, lastBuildDate:String, channel:[Channel]) {
//        self.version = version
//        self.lastBuildDate = lastBuildDate
//        self.channel = channel
//    }
//}
//
//class Channel: Decodable {
//    let title:String?
//    let link:String?
//    let source:String?
//    let item:[Item]
//
//    init(title:String, link:String, source:String, item:[Item]) {
//        self.title = title
//        self.link = link
//        self.source = source
//        self.item = item
//    }
//}
//
//class Item: Decodable {
//    let title:String?
////    let short_title:String?
////    let link:String?
////    let author:String?
////    let summary:String?
////    let item_class: String?
//
//    init(title:String) {
//        self.title = title
//    }
//}

