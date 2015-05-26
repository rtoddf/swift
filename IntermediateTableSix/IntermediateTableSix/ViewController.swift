import UIKit

class GameViewController: UITableViewController {
    
    var games = [VideoGame]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.games = [
            VideoGame(name: "Assassin's Creed", character: "Altaïr ibn-La'Ahad"),
            VideoGame(name: "Assassin's Creed II", character: "Ezio Auditore da Firenze"),
            VideoGame(name: "Assassin's Creed Brotherhood", character: "Ezio Auditore da Firenze"),
            VideoGame(name: "Assassin's Creed Revelations", character: "Ezio Auditore da Firenze"),
            VideoGame(name: "Assassin's Creed III", character: "Connor"),
            VideoGame(name: "Assassin's Creed IV: Black Flag", character: "Edward Kenway"),
            VideoGame(name: "Assassin's Creed Rogue", character: "Shay Patrick Cormac"),
            VideoGame(name: "Assassin's Creed Unity", character: "Arno Dorian"),
            VideoGame(name: "Assassin's Creed Victory", character: "unknown")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        var game: VideoGame
        game = games[indexPath.row]
        
        cell.textLabel?.text = game.name
        cell.detailTextLabel?.text = game.character
        
        return cell
    }


}
