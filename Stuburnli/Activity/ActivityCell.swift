//
//  ActivityCell.swift
//  Stuburnli
//
//  Created by SHAGUN  on 11/29/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

    @IBOutlet var checkBox: UIImageView!
    @IBOutlet var activityLabel: UILabel?
   
    @IBOutlet var button: UIButton!
    
    func updateLabels(){
        checkBox.userInteractionEnabled = true
        let font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        activityLabel!.font = font
    }
}
