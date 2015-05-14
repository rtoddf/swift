import UIKit

class GameViewController: UITableViewController {
    
    var videoGames = [VideoGame]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // video games data - can this move
        self.videoGames = [
            VideoGame(title: "Assassin's Creed", mainCharacter: "Altaïr ibn-La'Ahad", leadImage: "assassins_creed.png", bodyCopy: "Desmond is captured by Abstergo and forced to use a machine called the Animus to explore Altaïr ibn-La'Ahad's memories during the time of the Third Crusade. Desmond begins to witness events after Altaïr breaks all three tenets of the Assassin Brotherhood while attempting to stop Robert de Sablé from taking a Piece of Eden. Al Mualim, the Brotherhood's leader, demotes Altaïr to Novice and tasks him with assassinating the nine Knights Templars, including de Sablé, to regain his former status. Altaïr's quest eventually leads him to face de Sablé in the presence of King Richard I of England warning the King of de Sablé's plot to kill him.\n\nAltaïr defeats de Sablé, but with his last words, de Sablé reveals that there were ten Templars, the last being Al Mualim, who now holds the Piece of Eden. Altaïr returns to face Al Mualim, struggling to fight through the illusions created by the Piece, but eventually kills Al Mualim. When Altaïr recovers the piece, he—and those watching the Animus—witness a holographic map showing locations across the globe where other artifacts are located. Desmond is pulled from the Animus, and was going to be killed, but his life is spared by Lucy Stillman, an Assassin working as a mole within Abstergo, as she claims they might need to further examine his memories later. He comes to learn that a former test subject had left messages only Desmond can see, foretelling of the end of the world in 2012.\n\nThe first Assassin's Creed introduced elements that would remain cornerstones of the rest of the series. The game attempts to create historical versions of Masyaf (the Brotherhood's location), Jerusalem, Acre and Damascus, and incorporates a number of documented historical figures into the story. The virtualized Animus system, free running, climbing, stealth, and parkour elements were all present in this title, as well as the initial formulation of the combat system. The player would have to complete a number of side quests before they would be able to obtain an assassin quest from a local Brotherhood guidemaster in each city, though future games would abandon this prerequisite."),
            VideoGame(title: "Assassin's Creed II", mainCharacter: "Ezio Auditore da Firenze", leadImage: "ezio_auditore_da_firenze.png", bodyCopy: "The frame narrative is set in the 21st century and follows Desmond Miles as he relives the genetic memories of his ancestor Ezio Auditore da Firenze. The main narrative takes place at the height of the Renaissance in Italy during the 15th and early 16th century. The player can explore Florence, Venice, Tuscany and Forlì as they guide Ezio on a quest for vengeance against those responsible for betraying his family."),
            VideoGame(title: "Assassin's Creed Brotherhood", mainCharacter: "Ezio Auditore da Firenze", leadImage: "assassins_creed_brotherhood.png", bodyCopy: "The story is set in a fictional history of real world events set in two time periods, the 16th and 21st centuries. The main portion of Assassin's Creed: Brotherhood takes place immediately after the plot of Assassin's Creed II, featuring 16th-century Assassin Ezio Auditore da Firenze in Italy and his quest to restore the Assassin order, and destroy his enemies: the Borgia family. Intersecting with these historical events are the modern day activities of series protagonist Desmond Miles, who relives his ancestor Ezio's memories to find a way to fight against the Assassins' enemies, the Templars, and to prevent the 2012 apocalypse."),
            VideoGame(title: "Assassin's Creed Revelations", mainCharacter: "Ezio Auditore da Firenze", leadImage: "assassins_creed_revelations.png", bodyCopy: "The story is set in a fictional history of real world events set in three time periods, and features three returning protagonists; Altaïr Ibn-La'Ahad in 12th and 13th century Masyaf, Ezio Auditore da Firenze in 16th century Constantinople, and series protagonist Desmond Miles in 21st century America. The main story follows the Assassin Ezio's journey to unlock the secret of Altaïr's vault in Masyaf using disc-like artifacts containing Altaïr's memories. Intersecting with these historical events are the modern day activities of Desmond, who relives Ezio's memories to find a way to fight against the Assassins' enemies, the Templars, and to prevent the 2012 apocalypse."),
            VideoGame(title: "Assassin's Creed III", mainCharacter: "Connor", leadImage: "assassins_creed_III.png", bodyCopy: "The plot is set in a fictional history of real world events and follows the centuries-old struggle between the Assassins, who fight for peace with free will, and the Templars, who desire peace through control. The framing story is set in the 21st century and features series protagonist Desmond Miles who, with the aid of a machine known as the Animus, relives the memories of his ancestors to find a way to avert the 2012 apocalypse. The story is set in the 18th century, before, during and after the American Revolution from 1753 to 1783, and follows Desmond's half-English, half-Mohawk ancestor, Ratonhnhaké:ton, also known as Connor, as he fights the Templars' attempts to gain freedom in the colonies."),
            VideoGame(title: "Assassin's Creed IV: Black Flag", mainCharacter: "Edward Kenway", leadImage: "assassins_creed_black_flag.png", bodyCopy: "The story is set in the early 18th century Caribbean during the Golden Age of Piracy, and follows notorious pirate Edward Kenway, grandfather of Assassin's Creed III protagonist Ratonhnhaké:ton and father of Haytham Kenway , who stumbles upon the conflict waged by the Assassins and Templars. Unlike previous games, gameplay elements focus more on ship-based exploration in the open world map, while also retaining the series' third-person land-based exploration, melee combat, and stealth system. Multiplayer also returns, albeit with only land-based modes and settings."),
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
    
    
    private struct Storyboard {
        static let CellReuseIndentifier = "Game"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIndentifier) as! UITableViewCell
        
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

            // videoGameDetailViewController.title = videoGames[selectedIndexPath.row].name
            // videoGameDetailViewController.gameTitleText = self.videoGames[selectedIndexPath.row].name
            // videoGameDetailViewController.characterText = self.videoGames[selectedIndexPath.row].character
            // videoGameDetailViewController.imageText = self.videoGames[selectedIndexPath.row].imageName
            // videoGameDetailViewController.descriptionText = self.videoGames[selectedIndexPath.row].description
        }
    }
    
}

