//
//  ActivityCollection.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/30/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class ActivityCollection {
    var activityCollection : [[Activity]] = [[],[]]
    
    func createActivity(activityname: String) -> Activity{
        
        let newActivity = Activity(activityName: activityname)
        return newActivity
    }
    
    func addActivty(activity: Activity){
        activityCollection[0].append(activity)
    }
    
    func imageTapped(activity: Activity){
        activity.activityMark = 1
        markAsCompleted(activity)
    }
    
    func markAsCompleted(activity: Activity){
        let index = activityCollection[0].indexOf(activity)
        let activityCompleted = activityCollection[0][index!]
        activityCollection[0].removeAtIndex(index!)
        activityCollection[1].append(activityCompleted)
    }

}
