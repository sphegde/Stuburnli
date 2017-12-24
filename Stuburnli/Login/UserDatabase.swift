//
//  Database.swift
//  Stuburnli
//
//  Created by SHAGUN  on 12/5/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class UserDatabase {

    var users = [User]()
    
    func createUser(name: String, email: String, username: String, password: String) -> User{
        let newuser = User(name: name, email: email, username: username, password: password)
        return newuser
    }
    
    func addNewUser(user: User){
        users.append(user)
    }
    
    func deleteUser(user: User){
        let index = users.indexOf(user)
        users.removeAtIndex(index!)
    }
    
    func checkLoginCredentials(username: String, password: String) -> Bool{
        if users.count > 0 {
        for i in 0...users.count-1 {
            if(users[i].username == username) && (users[i].password == password){
            return true
            }
            }
        }
        return false
    }
    
    func returnUserserialNumber(username: String) -> Int {
        for i in 0...users.count {
            if users[i].username == username{
            return i
            }
        }
    return 0
    }


}
