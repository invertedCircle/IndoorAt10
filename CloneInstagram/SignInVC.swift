//
//  SignInVC.swift
//  CloneInstagram
//
//  Created by Donald Mactavish on 10/07/2018.
//  Copyright © 2018 Inverted Circle. All rights reserved.
//

import UIKit
import Parse

class SignInVC: UIViewController {

    @IBOutlet weak var UsernameText: UITextField! // implements the variable of user text
    
    @IBOutlet weak var UserNamerPassword: UITextField! // implements variable of user password
    
    override func viewDidLoad() { //default swift method
        super.viewDidLoad()

        
    }
    
     //////////////////////////// CODE BLOCK FOR OLD USERS SIGN IN  /////////////////////////////
    @IBAction func SignInClicked(_ sender: Any) {
    
        if UsernameText.text != "" && UserNamerPassword.text != ""{ //checks if the username and password text bar is not empty
            
            PFUser.logInWithUsername(inBackground: UsernameText.text!, password:UserNamerPassword.text!) { (user, error) in //log in and give two outputs, error if user already exists or well the user..
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style:UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
            
                else {

////////   CODE TO REMEMBER THE LOGGED IN USERS WHEN APP IS CLOSED    ///////////////////
                   UserDefaults.standard.set(self.UsernameText.text!, forKey: "username")
                    
                    UserDefaults.standard.synchronize()

                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate

                    delegate.rememberUser()
                  
////////   CODE TO REMEMBER THE LOGGED IN USERS WHEN APP IS CLOSED    ///////////////////
                
                }
            }
            
        }
        
        else { //if the the username and password text bar is empty output error
            let alert = UIAlertController(title: "Error", message: "Usename needed!", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style:UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
   //////////////////////////// CODE BLOCK FOR OLD USERS SIGN IN  /////////////////////////////
    
    
    
    //////////////////////////// CODE BLOCK FOR NEW USERS SIGN UP  /////////////////////////////
    
    @IBAction func SignUpClicked(_ sender: Any) {
        
        if UsernameText.text != "" && UserNamerPassword.text != ""{ //checks if the username and password text bar is not empty
            
            let user = PFUser()
            user.username = UsernameText.text!
            user.password = UserNamerPassword.text!
            user.signUpInBackground { (success, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style:UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                    
                }

                else{
                    
                ////////   CODE TO REMEMBER THE LOGGED IN USERS WHEN APP IS CLOSED    ///////////////////
                    
                    UserDefaults.standard.set(self.UsernameText.text!, forKey: "username")
                    
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    delegate.rememberUser()
                    
               ////////   CODE TO REMEMBER THE LOGGED IN USERS WHEN APP IS CLOSED    ///////////////////

                }
            }
        }
        // if empty then ouptut an error
        else {
            let alert = UIAlertController(title: "Error", message: "Usename needed!", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style:UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //////////////////////////// CODE BLOCK FOR NEW USERS SIGN UP  /////////////////////////////
}
