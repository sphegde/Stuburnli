//
//  Activity.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/30/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class Activity:NSObject{
    var activityMark: Int?
    var activityName: String?
    var dateOfCompletion: NSDate?
    var timeOfCompletion: NSDate?
    var notes: Array<String>?
    
//    var alarmTime: NSTimer?
    
    init(activityName: String){
        self.activityName = activityName
        self.dateOfCompletion = nil
        self.timeOfCompletion = nil
        self.activityMark = 0
        self.notes = []
//        self.alarmTime = alarmTime
    }
    
}
