//
//  TaskViewController.swift
//  TO DO List
//
//  Created by Eduardo Fornari on 10/04/17.
//  Copyright © 2017 Fornari. All rights reserved.
//

import UIKit
import CoreData

class TaskViewController: UIViewController, UITextFieldDelegate {
    
    var task: Task = Task()
    
    var moc = DataController().managedObjectContext
    
    @IBOutlet weak var taskNameUITextField: UITextField!
    
    @IBOutlet weak var taskDescriptionUITextField: UITextView!
    
    override func viewDidLoad() {
        taskNameUITextField.text = task.taskName
        taskDescriptionUITextField.text = task.taskDescription
        
        taskDescriptionUITextField.layer.borderColor = UIColor(colorLiteralRed: 230/255, green: 229/255, blue: 230/255, alpha: 1).cgColor
        taskDescriptionUITextField.placeholder = "Description"
        self.navigationController?.navigationItem.backBarButtonItem
    }
    
    @IBAction func buttonDonePressed(_ sender: UIBarButtonItem) {
        do {
            task.taskDescription = taskDescriptionUITextField.text
            try moc.save()
            performSegue(withIdentifier: "TasksSegue", sender: self)
        } catch {
            
        }
    }

    
}
