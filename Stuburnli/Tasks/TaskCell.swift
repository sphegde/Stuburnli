//
//  TaskCell.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/25/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell{

    @IBOutlet var taskLabel: UILabel!
    var name: String?
    
    func updateLabel(){
        //taskLabel.text = ""
        let font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        taskLabel.font = font
    }
}
