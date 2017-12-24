//
//  ActivityViewController.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/30/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var activityTextField: UITextField!
    @IBOutlet var activityTableView: UITableView!
    
    
    var nameOfTask: String?
    var taskNumber: Int?
    var tappedImageRow: Int?
    var sections = ["","Completed"]
    
    var activityCollection: ActivityCollection!
    var activitycellArray: Array<ActivityCell!> = []
    
    @IBOutlet var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "scenic_one")

        if let name = nameOfTask {
            self.title = name
        }
        activityTextField.delegate = self
        activityTextField.placeholder = "Add Activity ..."
        
        
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        activityTableView.contentInset = insets
        activityTableView.backgroundColor = UIColor.clearColor()
        activityTableView.estimatedRowHeight = 65
        
        // Do any additional setup after loading the view, typically from a nib.
    }
//    override func viewWillAppear(animated: Bool) {
//        let imageView = activitycell.checkBox
//        imageView.image = UIImage(named: "uncheckedbox")
//        imageView.userInteractionEnabled = true
//        let tapGestureRecogniser = UITapGestureRecognizer(target: ActivityCell.self, action: #selector(ActivityViewController.imageTapped))
//        imageView.addGestureRecognizer(tapGestureRecogniser)
//    }
    override func viewWillDisappear(animated: Bool) {
            print("Count: \(activityCollection.activityCollection[0].count)")

    }
    @IBAction func backgroundTapped(gestureRecogniser: UIGestureRecognizer){
        
        view.endEditing(true)
    }
    
    func tapButton(sender: AnyObject) {
        let buttonRow = sender.tag
        activitycellArray[buttonRow].checkBox.image = UIImage(named: "checkbox")
         let activity = activityCollection.activityCollection[0][buttonRow]
        activityCollection.imageTapped(activity)
        activityTableView.reloadData()
        print(buttonRow)
    }
//    func imageTapped(image: UIImageView){
//        print("Tapped")
//        print("\(activityCollection.activityCollection[0].count)")
//        let activitySection = activityCollection.activityCollection[0]
//        let activity = activitySection[image.tag]
//        //let image:UIImage! = UIImage(named: "checkbox")
//        activitycell.checkBox.image = UIImage(named: "checkbox")
//        activityCollection.imageTapped(activity)
//        print("\(activityCollection.activityCollection[0].count)")
//}
    
    func textFieldShouldReturn(activityTextField: UITextField) -> Bool {
        addActivity()
        activityTextField.resignFirstResponder()
        activityTextField.text = ""
        return true
    }
    
    func handleTap(sender: UITapGestureRecognizer){
    
    }
    
    func addActivity(){
        let newActivity = activityCollection.createActivity(activityTextField.text!)
        activityCollection.addActivty(newActivity)
        
        if let index = activityCollection.activityCollection[0].indexOf(newActivity) {
            let indexpath = NSIndexPath(forRow: index, inSection: 0)
            activityTableView.insertRowsAtIndexPaths([indexpath], withRowAnimation: .Automatic)
        }
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return activityCollection.activityCollection.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityCollection.activityCollection[section].count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath) as! ActivityCell
        print("Tapped")
   //         performSegueWithIdentifier("toThirdView", sender: cell)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("activityCell", forIndexPath: indexPath) as! ActivityCell
        cell.updateLabels()
        print(activityCollection.activityCollection.count)
        print(indexPath.row)
        //var tappedImageSection = indexPath.section
        tappedImageRow = indexPath.row
        let activitySection = activityCollection.activityCollection[indexPath.section]
        let activity = activitySection[indexPath.row]
        cell.activityLabel!.text = activity.activityName
        if(indexPath.section == 0){
            cell.checkBox.image = UIImage(named: "uncheckbox")
            cell.button.tag = indexPath.row
            cell.button.addTarget(self, action: #selector(self.tapButton(_:)), forControlEvents: .TouchUpInside)
            activitycellArray.append(cell)
        }
        else{
        cell.checkBox.image = UIImage(named: "checkbox")
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toThirdView" {
            if (activityTableView.indexPathForSelectedRow?.row) != nil && activityTableView.indexPathForSelectedRow?.section != 1{
                let thirdViewController = segue.destinationViewController as! ThirdViewController
                let row = activityTableView.indexPathForSelectedRow?.row
                let activityObject = activityCollection.activityCollection[0][row!]
                thirdViewController.activity = activityObject
            }
        }
    }

    
}
