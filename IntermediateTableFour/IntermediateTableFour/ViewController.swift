import UIKit

class GameViewController: UITableViewController {
    
    var games = [VideoGame]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.games = [
            VideoGame(name: "Assassin's Creed", character: "Altaïr ibn-La'Ahad", imageName: "arno_dorian.png", description: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade."),
            VideoGame(name: "Assassin's Creed II", character: "Ezio Auditore da Firenze", imageName: "ezio_auditore_da_firenze.png", description: "The frame narrative is set in the 21st century and follows Desmond Miles as he relives the genetic memories of his ancestor Ezio Auditore da Firenze. The main narrative takes place at the height of the Renaissance in Italy during the 15th and early 16th century. The player can explore Florence, Venice, Tuscany and Forlì as they guide Ezio on a quest for vengeance against those responsible for betraying his family."),
            VideoGame(name: "Assassin's Creed Brotherhood", character: "Ezio Auditore da Firenze", imageName: "assassins_creed_brotherhood.png", description: "The story is set in a fictional history of real world events set in two time periods, the 16th and 21st centuries. The main portion of Assassin's Creed: Brotherhood takes place immediately after the plot of Assassin's Creed II, featuring 16th-century Assassin Ezio Auditore da Firenze in Italy and his quest to restore the Assassin order, and destroy his enemies: the Borgia family. Intersecting with these historical events are the modern day activities of series protagonist Desmond Miles, who relives his ancestor Ezio's memories to find a way to fight against the Assassins' enemies, the Templars, and to prevent the 2012 apocalypse."),
            VideoGame(name: "Assassin's Creed Revelations", character: "Ezio Auditore da Firenze", imageName: "arno_dorian.png", description: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade."),
            VideoGame(name: "Assassin's Creed III", character: "Connor", imageName: "arno_dorian.png", description: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade."),
            VideoGame(name: "Assassin's Creed IV: Black Flag", character: "Edward Kenway", imageName: "arno_dorian.png", description: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade."),
            VideoGame(name: "Assassin's Creed Rogue", character: "Shay Patrick Cormac", imageName: "arno_dorian.png", description: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade."),
            VideoGame(name: "Assassin's Creed Unity", character: "Arno Dorian", imageName: "assassins_creed_unity.png", description: "Set within Paris during the French Revolution, the single-player story follows Arno Dorian in his efforts to expose the true powers behind the Revolution. The game retains the series' third-person open world exploration as well as introducing a revamped combat, parkour and stealth system. The game also introduces cooperative multiplayer to the Assassin's Creed series, letting up to four players engage in narrative-driven missions and explore the open-world map."),
            VideoGame(name: "Assassin's Creed Victory", character: "unknown", imageName: "arno_dorian.png", description: "Desmond Miles, a bartender, is kidnapped by Abstergo Industries. There, Desmond is forced to interface with the Animus, a device that is able to replay the genetic memories of the user's ancestors. In Desmond's case, they seek information about his ancestor Altaïr Ibn-La'Ahad, an Assassin during the time of the Third Crusade.")
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
        return games.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        var game : VideoGame
        game = games[indexPath.row]
        
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
        
        cell.textLabel?.text = game.name
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(20)
        
        cell.detailTextLabel?.text = game.character
        cell.detailTextLabel?.backgroundColor = UIColor.clearColor()
        cell.detailTextLabel?.font = UIFont.italicSystemFontOfSize(14)
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gameSegue" {
            let ViewController: VideoGameDetail = segue.destinationViewController as! VideoGameDetail
            let indexPath = self.tableView.indexPathForSelectedRow()!

            ViewController.title = self.games[indexPath.row].name
            ViewController.gameTitleText = self.games[indexPath.row].name
            ViewController.characterText = self.games[indexPath.row].character
            ViewController.imageText = self.games[indexPath.row].imageName
            ViewController.descriptionText = self.games[indexPath.row].description
        }
    }
    
}

