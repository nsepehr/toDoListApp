//
//  XYZAddToDoItemViewController.swift
//  ToDoList
//
//  Created by Nima Sepehr on 11/30/14.
//  Copyright (c) 2014 Nima Sepehr. All rights reserved.
//

import UIKit

class XYZAddToDoItemViewController: UIViewController,UITextFieldDelegate {
    
    lazy var newItem = XYZToDoItem()

    @IBOutlet weak var taskTextField: UITextField! = nil
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("I'm preparing for seqeue")
        println("textField \(taskTextField), doneButton \(doneButton), sender, \(sender) ")
        if (sender as UIBarButtonItem) != doneButton {
            // Done button not pressed return
            println("Not Done button, returning")
            return
        }
        var myEnteredTask: String = taskTextField.text
        if myEnteredTask.isEmpty {
            return
        }
        newItem.itemName = myEnteredTask
        newItem.completed = false
        newItem.creationDate = NSDate()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //    println("Preparing for segue")
    //}

}
