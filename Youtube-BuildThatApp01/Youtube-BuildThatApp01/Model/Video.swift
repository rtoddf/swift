import UIKit


class Video:NSObject {
    var thumbnailImageName:String?
    var title:String?
    var subtitleText:String?
    var numberOfViews:NSNumber?
    var uploadDate:NSDate?
    var channel:Channel?
}

class Channel:NSObject {
    var channelName:String?
    var profileImageName:String?
}
