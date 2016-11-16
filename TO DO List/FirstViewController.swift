//
//  FirstViewController.swift
//  TO DO List
//
//  Created by Eduardo Segura Fornari on 10/11/16.
//  Copyright © 2016 Fornari. All rights reserved.
//

import UIKit
import CoreData
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Returning to view
    override func viewWillAppear(_ animated: Bool) {
        fetch()
        tblTasks.reloadData()
        
    }
    
    //
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if(editingStyle == UITableViewCellEditingStyle.delete){
            let taskName = taskMgr.tasks[indexPath.row].name;
            deleteTask(taskName: taskName)
            taskMgr.tasks.remove(at: indexPath.row)
            tblTasks.reloadData()
        }
    }

    //UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "test")
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        return cell
    }
    
    func fetch() {
        let moc = DataController().managedObjectContext
        let taskFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskEntity")
        var tasks = [task]()
        do {
            
            let fetchedTask = try moc.fetch(taskFetch) as! [Task]
            for taskAUX in fetchedTask {
                tasks.append(task(name: taskAUX.taskName!, desc: taskAUX.taskDescription!))
            }
            taskMgr.tasks = tasks
            
        } catch {
            fatalError("Failed to fetch person: \(error)")
        }
    }
    
    func deleteTask(taskName: String) -> Bool {
        let moc = DataController().managedObjectContext
        let taskFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskEntity")
        do {
            
            let fetchedTask = try moc.fetch(taskFetch) as! [Task]
            for taskAUX in fetchedTask {
                if(taskName == taskAUX.taskName!){
                    
                    let task = taskAUX as NSManagedObject
                    
                    moc.delete(task)

                    do {
                        try moc.save()
                    } catch {
                        let saveError = error as NSError
                        print(saveError)
                    }
                    
                    
                    return true
                }
            }
            return false
            
        } catch {
            fatalError("Failed to validate task: \(error)")
        }
    }
    
}

