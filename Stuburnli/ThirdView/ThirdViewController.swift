//
//  ThirdViewController.swift
//  Stuburnli
//
//  Created by SHAGUN  on 12/3/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    var activity: Activity!
    
    var dateOfCompletion: NSDate!
    var timeOfCompletion: NSDate!
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var timePicker: UIDatePicker!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var dateSwitch: UISwitch!
    @IBOutlet var timeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("sct: \(activity)")
        
        self.title = "Reminders & Notes"
        
        datePicker.datePickerMode = .Date
        timePicker.datePickerMode = .Time
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateStyle = .ShortStyle

        
        if (activity.dateOfCompletion == nil){
        dateSwitch.setOn(false, animated: false)
        dateLabel.text = "Date: Disabled"
        }
        else if(activity.dateOfCompletion != nil){
        dateSwitch.setOn(true, animated: true)
        datePicker.date = activity.dateOfCompletion!
        dateLabel.text = "Date: \(dateFormatter.stringFromDate(datePicker.date))"
        dateOfCompletion = datePicker.date
        }
        
        
        if (activity.timeOfCompletion == nil){
        timeSwitch.setOn(false, animated: true)
        timeLabel.text = "Time: Disabled"
        }
        else if(activity.timeOfCompletion != nil){
        timeSwitch.setOn(true, animated: true)
        timePicker.date = activity.timeOfCompletion!
        timeLabel.text = "Time: \(timeFormatter.stringFromDate(timePicker.date))"
        timeOfCompletion = timePicker.date
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        updateActivity(activity)
        if let time = activity.timeOfCompletion, let date = activity.dateOfCompletion{
        print(time)
        print(date)
        }
        else {
        print("Nil")
        }
    }
    
    
    @IBAction func activateTime(sender: AnyObject) {
        if timeSwitch.on{
            timeLabel.text = "Time:"
            timePicker.addTarget(self, action: #selector(ThirdViewController.displayTime(_:)), forControlEvents: .ValueChanged)
        }
        else {
            timeLabel.text = ("Time: Disabled")
            timeOfCompletion = nil
        }

    }
    
    @IBAction func activateDate(sender: AnyObject) {
        if dateSwitch.on {
            dateLabel.text = "Date:"
            datePicker.addTarget(self, action: #selector(ThirdViewController.displayDate(_:)), forControlEvents: .ValueChanged)
        }
        else {
            dateLabel.text = ("Date: Disabled")
            dateOfCompletion = nil
        }


    }
    
    func displayDate (datePicker: UIDatePicker){
        if dateSwitch.on {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .NoStyle
        //dateFormatter.timeStyle = .LongStyle
        dateLabel.text = ("Date: \(dateFormatter.stringFromDate(datePicker.date))")
        dateOfCompletion = datePicker.date
        }
        else {
            dateLabel.text = ("Date: Disabled")
            dateOfCompletion = nil
        }
    }
    
    func displayTime (timePicker: UIDatePicker){
        if timeSwitch.on {
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateStyle = .NoStyle
        timeFormatter.timeStyle = .ShortStyle
        timeLabel.text = ("Time: \(timeFormatter.stringFromDate(timePicker.date))")
        timeOfCompletion = timePicker.date
        }
        else {
            timeLabel.text = ("Time: Disabled")
            timeOfCompletion = nil
        }

    }
    
    func updateActivity(activity: Activity){
        activity.dateOfCompletion = dateOfCompletion
        activity.timeOfCompletion = timeOfCompletion
    }
    
}
