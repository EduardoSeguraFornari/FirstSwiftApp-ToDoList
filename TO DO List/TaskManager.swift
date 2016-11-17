import UIKit

var taskMgr: TaskManager = TaskManager()

class TaskManager: NSObject {
    
    var tasks = [Task]()
    
    func addTask(task: Task){
        tasks.append(task)
    }

}
