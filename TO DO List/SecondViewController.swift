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
    
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Events
    @IBAction func btnAddTask(_ sender: UIButton) {
        if(txtTask.text == "" && txtDesc.text == ""){
            let alertController = UIAlertController(title: "Empty fields!", message: "The fields can't stay empty.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else if(txtTask.text == ""){
            let alertController = UIAlertController(title: "Empty field!", message: "The 'Task Name' field can't stay empty.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else if(txtDesc.text == ""){
            let alertController = UIAlertController(title: "Empty field!", message: "The 'Description' field can't stay empty.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else{
            taskMgr.addTask(name: txtTask.text!, desc: txtDesc.text!);
            self.view.endEditing(true)
            txtTask.text = ""
            txtDesc.text = ""
            saveTask(taskName: txtTask.text!, taskDescription: txtDesc.text!)
            self.tabBarController?.selectedIndex = 0;
        }
    }
    
    func saveTask(taskName: String, taskDescription: String) {
        
        // create an instance of our managedObjectContext
        let moc = DataController().managedObjectContext
        
        // we set up our entity by selecting the entity and context that we're targeting
        let entity = NSEntityDescription.insertNewObject(forEntityName: "TaskEntity", into: moc) as! Task
        
        // add our data
        entity.setValue(taskName, forKey: "taskName")
        entity.setValue(taskDescription, forKey: "taskDescription")
        
        // we save our entity
        do {
            try moc.save()
            print("Salvou")
        } catch {
            //fatalError("Failure to save context: \(error)")
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

