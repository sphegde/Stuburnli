//
//  Tasks.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/25/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class Tasks: NSObject{
    
    var taskName: String?
    
    init(taskname: String) {
        self.taskName = taskname
        super.init()
    }

}
