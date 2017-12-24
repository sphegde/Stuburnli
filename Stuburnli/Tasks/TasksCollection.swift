//
//  TasksCollection.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/25/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class TasksCollection{
    
    var tasks = [Tasks]()
    
    func createTask(taskname: String) -> Tasks{
    
        let newtask = Tasks(taskname: taskname)
        return newtask
        
    }
    
    func addTask(task: Tasks){
        tasks.append(task)
    }
    
    
    func deleteTask(task: Tasks){
        let index = tasks.indexOf(task)
        tasks.removeAtIndex(index!)
    }
    
}
