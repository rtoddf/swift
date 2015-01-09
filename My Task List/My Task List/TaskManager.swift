import UIKit

var taskMGR: TaskManager = TaskManager()
struct task{
    var name = "un-named"
    var desc = "un-described"
}


class TaskManager: NSObject {
    // use () at the end to create an empty array
    var tasks = [task]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
        
    }
}
