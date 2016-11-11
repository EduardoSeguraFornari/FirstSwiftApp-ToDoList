//
//  SecondViewController.swift
//  TO DO List
//
//  Created by Eduardo Segura Fornari on 10/11/16.
//  Copyright © 2016 Fornari. All rights reserved.
//

import UIKit

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
            let alertController = UIAlertController(title: "Empty fields!", message: "The fields can not stay empty.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else if(txtTask.text == ""){
            let alertController = UIAlertController(title: "Empty field!", message: "The name field can not stay empty.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else if(txtDesc.text == ""){
            let alertController = UIAlertController(title: "Empty field!", message: "The description field can not stay empty.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else{
            taskMgr.addTask(name: txtTask.text!, desc: txtDesc.text!);
            self.view.endEditing(true)
            txtTask.text = ""
            txtDesc.text = ""
        self.tabBarController?.selectedIndex = 0;
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

