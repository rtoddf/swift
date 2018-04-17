import Foundation

let jsonString = """
[
    {
        "headline": "Steven Spielberg's Ready Player One improves immensely on the book",
        "author": "Tasha Robinson",
        "item_class": "review",
        "guid": "f21f6d26-2163-11e8-8401-ed4dfe8ebc2c",
        "pub_date": "Fri, 06 Apr 2018 09:25:00 EDT"
    }
]
"""

let jsonData = Data(jsonString.utf8)
var stories:[Story]

struct Story: Decodable {
    let headline:String?
    let author:String?
    let guid:String?
    
    let itemClass:String?
    let pubDate:String?
    
    // swift 4.0
//    private enum CodingKeys:String, CodingKey {
//        case headline, author, guid
//        case itemClass = "item_class"
//        case pubDate = "pub_date"
//    }
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

do {
    stories = try decoder.decode([Story].self, from: jsonData)
    print(stories)
} catch {
    print(error.localizedDescription)
}
