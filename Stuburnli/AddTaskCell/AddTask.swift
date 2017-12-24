//
//  AddTask.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/25/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class AddTask: UITableViewCell{
    
    
    @IBOutlet var addTaskField: UITextField!
    
    var addTaskFieldText: String!
    
    func textFieldShouldReturn(addTaskField: UITextField){
    addTaskFieldText = addTaskField.text
    
    }
    
    func initialText(){
        addTaskField.placeholder = "Add Task .."
    }

}
