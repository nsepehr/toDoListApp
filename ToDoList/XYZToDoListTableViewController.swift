//
//  XYZToDoListTableViewController.swift
//  ToDoList
//
//  Created by Nima Sepehr on 11/30/14.
//  Copyright (c) 2014 Nima Sepehr. All rights reserved.
//

import UIKit

class XYZToDoListTableViewController: UITableViewController {
    
    var toDoItem: [XYZToDoItem] = []
    
    let dateFormat: NSDateFormatterStyle = .ShortStyle
    let timeFormat: NSDateFormatterStyle = .ShortStyle
    var myFormatter: NSDateFormatter {
        let format = NSDateFormatter()
        format.dateStyle = dateFormat
        format.timeStyle = timeFormat
        return format
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadInitialData() {
        println("Loading initial data")
        // Function load some data into array toDoItem
        let item1: XYZToDoItem = XYZToDoItem()
        item1.itemName = "Task1"
        item1.creationDate = NSDate()
        item1.compDate = NSDate()
        item1.completed = false
        self.toDoItem.append(item1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        var myCount: Int = self.toDoItem.count
        println("Count of my cells are \(myCount)")
        return myCount
    }

    @IBAction func unwindToList(seque: UIStoryboardSegue) {
        // Left empty for now
        println("Im unwinding")
        let source: XYZAddToDoItemViewController = seque.sourceViewController as XYZAddToDoItemViewController
        let myItem = source.newItem

        if myItem.itemName == nil{
            return
        }
        println("my return text field is \(myItem.itemName)")
        self.toDoItem.append(myItem)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("Inside cellForRowAtIndexPath")
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as XYZTaskTableViewCell

        // Configure the cell...
        var toDoItem = self.toDoItem[indexPath.row]
        cell.taskLabel.text = toDoItem.itemName
        var taskDate: NSDate = toDoItem.creationDate
        var dateString: String! = myFormatter.stringFromDate(taskDate)
        cell.dateLabel.text = dateString
        if toDoItem.completed == true {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            var compDate: NSDate = toDoItem.compDate
            var compDateString = myFormatter.stringFromDate(compDate)
            cell.compDate.text = compDateString
            cell.compDate.hidden = false
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
            cell.compDate.hidden = true
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) ->() {
        println("Inside didSelectRowAtIndex")
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        self.toDoItem[indexPath.row].completed = !self.toDoItem[indexPath.row].completed
        if self.toDoItem[indexPath.row].completed == true {
            self.toDoItem[indexPath.row].compDate = NSDate()
        }
        // Debug
        println("Selected row is: \(indexPath.row)")
        // End of debug
        var myPathArray: NSArray = [indexPath]
        tableView.reloadRowsAtIndexPaths(myPathArray, withRowAnimation: .None)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
