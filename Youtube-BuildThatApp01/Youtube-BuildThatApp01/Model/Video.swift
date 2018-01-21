import UIKit


class Video:NSObject {
    var thumbnailImageName:String?
    var title:String?
    var channel:Channel?
}

class Channel:NSObject {
    var channelName:String?
    var profileImageName:String?
}
