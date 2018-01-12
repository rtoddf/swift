import Foundation
import UIKit

//: Here's our data from the internetz.
let json = """
  {
    "id": 1,
    "name": "swift.berlin",
    "language_name": "swift",
    "host": [{
        "name": "Flixbus"
    }]
  }
  """.data(using: String.Encoding.utf8)!

// the meetup info, now conforming to Decodable
struct Meetup: Decodable {
    var name: String
    var language_name:String
    var host: [Host]
}

// the hosting company, now conforming to Decodable
struct Host: Decodable {
    var name:String
}

let meetup = try! JSONDecoder().decode(Meetup.self, from: json)

print(meetup.host[0].name)


//https://dzone.com/articles/how-much-does-it-cost-to-develop-an-on-demand-deli-1

