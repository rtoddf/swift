import Foundation
import UIKit

//video class
class Video {

    var image: UIImage
    var title: String
    var url:String
    var description:String
    
    init(image:UIImage, title:String, url:String, description:String) {
        self.image = image
        self.title = title
        self.url = url
        self.description = description
    }
    
    class func createArray() -> [Video] {
        var tempVideos:[Video] = []
        
        let video1 = Video(image: #imageLiteral(resourceName: "aaron-rhodes"),
                           title: "Aaron Rhodes",
                           url: "https://www.youtube.com",
                           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a tempor augue. Duis cursus ut arcu lobortis lobortis. Etiam id sagittis tortor, quis consequat mi.")
        
        let video2 = Video(image: #imageLiteral(resourceName: "matt-bomer"),
                           title: "Matt Bomer",
                           url: "https://www.youtube.com",
                           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a tempor augue. Duis cursus ut arcu lobortis lobortis. Etiam id sagittis tortor, quis consequat mi.")
        
        let video3 = Video(image: #imageLiteral(resourceName: "nyle-dimarco"),
                           title: "Nyle Dimarco",
                           url: "https://www.youtube.com",
                           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a tempor augue. Duis cursus ut arcu lobortis lobortis. Etiam id sagittis tortor, quis consequat mi.")
        
        let video4 = Video(image: #imageLiteral(resourceName: "colton-haynes"),
                           title: "Colton Haynes",
                           url: "https://www.youtube.com",
                           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a tempor augue. Duis cursus ut arcu lobortis lobortis. Etiam id sagittis tortor, quis consequat mi.")
        
        let video5 = Video(image: #imageLiteral(resourceName: "eli-lieb"),
                           title:"Eli Lieb",
                           url: "https://www.youtube.com",
                           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a tempor augue. Duis cursus ut arcu lobortis lobortis. Etiam id sagittis tortor, quis consequat mi.")
        
        let video6 = Video(image: #imageLiteral(resourceName: "gus-kenworthy"),
                           title: "Gus Kenworthy",
                           url: "https://www.youtube.com",
                           description: "Augustus Richard Gus Kenworthy (born October 1, 1991) is a British-born American freestyle skier from Telluride, Colorado who competes in slopestyle and the halfpipe. Kenworthy won the silver medal in Men's freestyle skiing at the 2014 Winter Olympics in Sochi, Russia. In October 2015, Kenworthy came out as gay in an interview with ESPN. He said in a later interview with Attitude magazine that he picked to come out in ESPN because I wanted to do it in my words and once and for all – and hopefully help kids that are in the same position I was. Rolling Stone noted the freestyle medalist is the first action-sports star to come out.")
        
        let video7 = Video(image: #imageLiteral(resourceName: "matt-doyle"),
                           title: "Matt Doyle",
                           url: "https://www.youtube.com",
                           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a tempor augue. Duis cursus ut arcu lobortis lobortis. Etiam id sagittis tortor, quis consequat mi.")
        
        let video8 = Video(image: #imageLiteral(resourceName: "shaping-sound"),
                           title: "Shaping Sound",
                           url: "https://www.youtube.com",
                           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a tempor augue. Duis cursus ut arcu lobortis lobortis. Etiam id sagittis tortor, quis consequat mi.")
        
        let video9 = Video(image: #imageLiteral(resourceName: "tom-daley"),
                           title: "Tom Daley",
                           url: "https://www.youtube.com",
                           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a tempor augue. Duis cursus ut arcu lobortis lobortis. Etiam id sagittis tortor, quis consequat mi.")
        
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        tempVideos.append(video6)
        tempVideos.append(video7)
        tempVideos.append(video8)
        tempVideos.append(video9)
        
        return tempVideos
    }
}
