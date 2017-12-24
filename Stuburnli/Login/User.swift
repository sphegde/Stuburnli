//
//  UserDataBase.swift
//  Stuburnli
//
//  Created by SHAGUN  on 12/5/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit
class User: NSObject {
    var name: String?
    var email: String?
    var username: String?
    var password: String?
    
    init(name: String, email:String, username: String, password:String){
        self.name = name
        self.email = email
        self.username = username
        self.password = password
    }
    


}
