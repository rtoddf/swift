import Foundation

class User: NSObject {
    @objc var name: String!
    @objc var email: String!
}

let dictionaryOfUsers = [
    ["name": "name1", "email": "name1@xyz.com"],
    ["name": "name2", "email": "name2@gmail.com"]
]

var users = [User]()
for dictionary in dictionaryOfUsers {
    let user = User()
    user.setValuesForKeys(dictionary)
    users.append(user)
}

for user in users {
    print(user.name)
}

struct Category:Decodable {
    var name:String?
    //    var apps:[Person]?
}

let jsonUrlString = "http://rtodd.net/swift/data/apps02.json"
let url = URL(string: jsonUrlString)

URLSession.shared.dataTask(with: url!) { (data, response, error) in

    guard let data = data else { return }
    print(data)
    
    do {
        let people  = try JSONDecoder().decode(Category.self, from:data)
        print(people)
        
    } catch let jsonErr {
        print("error serializing JSON:", jsonErr)
    }
    
}.resume()
