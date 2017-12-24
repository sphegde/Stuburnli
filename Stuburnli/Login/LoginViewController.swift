//
//  LoginViewController.swift
//  Stuburnli
//
//  Created by SHAGUN  on 12/5/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    var userdatabase: UserDatabase!
    
    var userNumber: Int!
    //var emptyField: String = ""
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var invalidLabel: UILabel!
    @IBOutlet var passWord: UITextField!
    @IBOutlet var userName: UITextField!
    @IBAction func loginButton(sender: AnyObject) {
        if(userName.text! != "" && passWord.text! != ""){
        if userdatabase.checkLoginCredentials(userName.text!, password: passWord.text!){
            invalidLabel.text = ""
            userNumber = userdatabase.returnUserserialNumber(userName.text!)
        }
        }
        else{
            invalidLabel.text = "Invalid Username or Password"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = ""
        passWord.text = ""
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.text = "Stuburnli"
        invalidLabel.text = ""
        backgroundImage.image = UIImage(named: "scenic_one")
        self.title = "Stuburnli"
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(userName.text! != "" && passWord.text! != ""){
        if segue.identifier == "toMainPage" && userdatabase.checkLoginCredentials(userName.text!, password: passWord.text!){
            let viewController = segue.destinationViewController as? PrimaryViewController
            let taskCollection = TasksCollection()
            viewController!.database = userdatabase
            viewController!.taskCollection = taskCollection
            viewController!.userNumber = userNumber
            }
        }
        else if segue.identifier == "toNewUser" {
            let viewController = segue.destinationViewController as? NewUserViewController
            viewController?.database = userdatabase
        }
    }
}
