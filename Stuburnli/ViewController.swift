//
//  ViewController.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/26/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var profileName: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var addTaskTextField: UITextField!
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBAction func logoutPressed(sender: AnyObject) {
    }
    var database: UserDatabase!
    var taskCollection: TasksCollection!
    //var addTask: AddTask!
    
    var userNumber: Int!
    
    var objectsOfActivityCollection: Array<ActivityCollection> = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "scenic_one")
        self.title = "Tasks"
        profileName.text = database.users[userNumber].name
        profileImage.image = UIImage(named: "profile")
        addTaskTextField.delegate = self
        addTaskTextField.placeholder = "Add Task.."
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        
        tableView.backgroundColor = UIColor.clearColor()
        
        tableView.estimatedRowHeight = 65
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(addTaskTextField: UITextField) -> Bool {
        if(addTaskTextField.text != ""){
        addTaskToTableView()
        addTaskTextField.resignFirstResponder()
        addTaskTextField.text = ""
        }
        return true
    }
    
    func addTaskToTableView(){
        let newTask = taskCollection.createTask(addTaskTextField.text!)
        taskCollection.addTask(newTask)
        
        if let index = taskCollection.tasks.indexOf(newTask) {
            let indexpath = NSIndexPath(forRow: index, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexpath], withRowAnimation: .Automatic)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskCollection.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! TaskCell
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.updateLabel()
        print(taskCollection.tasks.count)
        print(indexPath.row)
        let task = taskCollection.tasks[indexPath.row]
        cell.taskLabel.text = task.taskName
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toActivity" {
            if (tableView.indexPathForSelectedRow?.row) != nil {
                
                let activityViewController = segue.destinationViewController as! ActivityViewController
                
                let indexOfTask = tableView.indexPathForSelectedRow?.row
                let task = taskCollection.tasks[indexOfTask!]
                let taskName = task.taskName
                
                activityViewController.nameOfTask = taskName
                activityViewController.taskNumber = indexOfTask
                
                if((indexOfTask! + 1) <= objectsOfActivityCollection.count){
                    activityViewController.activityCollection = objectsOfActivityCollection[indexOfTask!]
                }
                else {
                    let activityCollection = ActivityCollection()
                    objectsOfActivityCollection.append(activityCollection)
                    activityViewController.activityCollection = objectsOfActivityCollection[indexOfTask!]
                }
                
            }
            
        }
        else if segue.identifier == "logOut"{
            let loginViewController = segue.destinationViewController as! LoginViewController
            loginViewController.userdatabase = UserDatabase ()
        }
    }
    
}

