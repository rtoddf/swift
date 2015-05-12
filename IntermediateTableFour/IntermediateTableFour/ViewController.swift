import UIKit

class GameViewController: UITableViewController {
    
    var videoGames = [VideoGame]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.videoGames = [
            VideoGame(title: "Assassin's Creed", mainCharacter: "Altaïr ibn-La'Ahad", leadImage: "arno_dorian.png", bodyCopy: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade."),
            VideoGame(title: "Assassin's Creed II", mainCharacter: "Ezio Auditore da Firenze", leadImage: "ezio_auditore_da_firenze.png", bodyCopy: "The frame narrative is set in the 21st century and follows Desmond Miles as he relives the genetic memories of his ancestor Ezio Auditore da Firenze. The main narrative takes place at the height of the Renaissance in Italy during the 15th and early 16th century. The player can explore Florence, Venice, Tuscany and Forlì as they guide Ezio on a quest for vengeance against those responsible for betraying his family."),
            VideoGame(title: "Assassin's Creed Brotherhood", mainCharacter: "Ezio Auditore da Firenze", leadImage: "assassins_creed_brotherhood.png", bodyCopy: "The story is set in a fictional history of real world events set in two time periods, the 16th and 21st centuries. The main portion of Assassin's Creed: Brotherhood takes place immediately after the plot of Assassin's Creed II, featuring 16th-century Assassin Ezio Auditore da Firenze in Italy and his quest to restore the Assassin order, and destroy his enemies: the Borgia family. Intersecting with these historical events are the modern day activities of series protagonist Desmond Miles, who relives his ancestor Ezio's memories to find a way to fight against the Assassins' enemies, the Templars, and to prevent the 2012 apocalypse."),
            VideoGame(title: "Assassin's Creed Revelations", mainCharacter: "Ezio Auditore da Firenze", leadImage: "arno_dorian.png", bodyCopy: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade."),
            VideoGame(title: "Assassin's Creed III", mainCharacter: "Connor", leadImage: "assassins_creed_III.png", bodyCopy: "The plot is set in a fictional history of real world events and follows the centuries-old struggle between the Assassins, who fight for peace with free will, and the Templars, who desire peace through control. The framing story is set in the 21st century and features series protagonist Desmond Miles who, with the aid of a machine known as the Animus, relives the memories of his ancestors to find a way to avert the 2012 apocalypse. The story is set in the 18th century, before, during and after the American Revolution from 1753 to 1783, and follows Desmond's half-English, half-Mohawk ancestor, Ratonhnhaké:ton, also known as Connor, as he fights the Templars' attempts to gain freedom in the colonies."),
            VideoGame(title: "Assassin's Creed IV: Black Flag", mainCharacter: "Edward Kenway", leadImage: "arno_dorian.png", bodyCopy: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade."),
            VideoGame(title: "Assassin's Creed Rogue", mainCharacter: "Shay Patrick Cormac", leadImage: "assassin_creed_rogue.png", bodyCopy: "The story is set in the mid-18th century during the Seven Years' War, and follows Shay Patrick Cormac, an Assassin-turned-Templar. Gameplay in Rogue is very similar to that of Black Flag with a mixture of ship-based naval exploration and third-person land-based exploration with some new features."),
            VideoGame(title: "Assassin's Creed Unity", mainCharacter: "Arno Dorian", leadImage: "assassins_creed_unity.png", bodyCopy: "Set within Paris during the French Revolution, the single-player story follows Arno Dorian in his efforts to expose the true powers behind the Revolution. The game retains the series' third-person open world exploration as well as introducing a revamped combat, parkour and stealth system. The game also introduces cooperative multiplayer to the Assassin's Creed series, letting up to four players engage in narrative-driven missions and explore the open-world map.")
        ]
        
        tableView.backgroundColor = UIColor(red: 0, green: 0.196, blue: 0.3, alpha: 1)
        tableView.separatorColor = UIColor.clearColor()
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoGames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        var game : VideoGame
        game = videoGames[indexPath.row]
        
        var gameBlue = UIColor(red: 0, green: 0.196, blue: 0.3, alpha: 1)
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.4)
            cell.textLabel?.textColor = UIColor.whiteColor()
            cell.detailTextLabel?.textColor = UIColor.whiteColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.75)
            cell.textLabel?.textColor = gameBlue
            cell.detailTextLabel?.textColor = gameBlue
        }
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        cell.textLabel?.text = game.title
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(20)
        
        cell.detailTextLabel?.text = game.mainCharacter
        cell.detailTextLabel?.backgroundColor = UIColor.clearColor()
        cell.detailTextLabel?.font = UIFont.italicSystemFontOfSize(14)
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gameSegue" {
            let videoGameDetailViewController: VideoGameDetail = segue.destinationViewController as! VideoGameDetail
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()!
            
            // get the cell tapped and send the object (VideoGame) to the DetailView
            let selectedVideoGame = videoGames[selectedIndexPath.row]
            videoGameDetailViewController.game = selectedVideoGame

//            videoGameDetailViewController.title = videoGames[selectedIndexPath.row].name
//            videoGameDetailViewController.gameTitleText = self.videoGames[selectedIndexPath.row].name
//            videoGameDetailViewController.characterText = self.videoGames[selectedIndexPath.row].character
//            videoGameDetailViewController.imageText = self.videoGames[selectedIndexPath.row].imageName
//            videoGameDetailViewController.descriptionText = self.videoGames[selectedIndexPath.row].description
        }
    }
    
}

