//
//  NewUserViewController.swift
//  Stuburnli
//
//  Created by SHAGUN  on 12/5/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    var database: UserDatabase!

    @IBOutlet var nameField: UITextField!
    @IBOutlet var EmailField: UITextField!
    @IBOutlet var UsernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    
    @IBAction func signUpButton(sender: AnyObject) {
        if (nameField.text != "" && EmailField.text != "" && UsernameField.text != "" && passwordField.text != ""){
        let newuser = database.createUser(nameField.text!, email: EmailField.text!, username: UsernameField.text!, password: passwordField.text!)
        database.addNewUser(newuser)
        }
        else {
            errorLabel.text = "Please Enter Credentials"
            errorLabel.backgroundColor = UIColor.clearColor()
            errorLabel.textColor = UIColor.darkGrayColor()
        }
        
        //performSegueWithIdentifier("toLoginPage", sender: self)
    }
    
    override func viewDidLoad() {
        errorLabel.text = ""
        backgroundImage.image = UIImage(named:"scenic_two")
        self.title = "Stuburnli"
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.text = "Stuburnli"
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toLoginPage" && (nameField.text != "" && EmailField.text != "" && UsernameField.text != "" && passwordField.text != ""){
            let viewController = segue.destinationViewController as? LoginViewController
            viewController?.userdatabase = database
        }
    }
}
