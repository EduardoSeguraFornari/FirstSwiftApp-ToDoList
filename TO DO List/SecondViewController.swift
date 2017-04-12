//
//  SecondViewController.swift
//  TO DO List
//
//  Created by Eduardo Segura Fornari on 10/11/16.
//  Copyright © 2016 Fornari. All rights reserved.
//

import UIKit
import CoreData
class SecondViewController: UIViewController, UITextFieldDelegate {
    
    let moc = DataController().managedObjectContext
    
    @IBOutlet var taskNameUITextField: UITextField!

    @IBOutlet weak var taskDescriptionUITextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDescriptionUITextField.layer.borderColor = UIColor(colorLiteralRed: 230/255, green: 229/255, blue: 230/255, alpha: 1).cgColor
        taskDescriptionUITextField.placeholder = "Description"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        taskDescriptionUITextField.resizePlaceholder()
    }
    
    @IBAction func buttonAddTaskPressed(_ sender: UIButton) {
        if(taskNameUITextField.text == ""){
            let alertController = UIAlertController(title: "Empty field!", message: "The 'Task Name' field can't stay empty.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else{
            if(validTask(nameTask: taskNameUITextField.text!)){
                
                let task = saveTask(taskName: taskNameUITextField.text!, taskDescription: taskDescriptionUITextField.text!)
                taskMgr.addTask(task: task);
                self.view.endEditing(true)
                taskNameUITextField.text = ""
                taskDescriptionUITextField.text = ""
                self.tabBarController?.selectedIndex = 0;
            }
            else{
                let alertController = UIAlertController(title: "Unexisting task", message: "This task name is already in use.", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                present(alertController, animated: true, completion: nil)
            }
            
        }
    }
    
    
    
    func saveTask(taskName: String, taskDescription: String) -> Task {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "TaskEntity", into: moc) as! Task
        
        entity.setValue(taskName, forKey: "taskName")
        entity.setValue(taskDescription, forKey: "taskDescription")
        
        do {
            try moc.save()
        } catch {
            
        }
        return entity
    }
    
    func validTask(nameTask: String) -> Bool{
        let taskFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskEntity")
        do {
            
            let fetchedTask = try moc.fetch(taskFetch) as! [Task]
            for taskAUX in fetchedTask {
                if(nameTask == taskAUX.taskName!){
                    return false
                }
            }
            return true
            
        } catch {
            fatalError("Failed to validate task: \(error)")
        }
    }
    
    //IOS Touch Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }


}

