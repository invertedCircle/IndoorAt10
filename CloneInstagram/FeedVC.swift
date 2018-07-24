//
//  FirstViewController.swift
//  CloneInstagram
//
//  Created by Donald Mactavish on 10/07/2018.
//  Copyright © 2018 Inverted Circle. All rights reserved.
//

import UIKit
import Parse

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    @IBAction func logoutClicked(_ sender: Any) { //logout button code
        
        PFUser.logOutInBackground { (error) in
            
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                UserDefaults.standard.removeObject(forKey: "username") //casts to SignIn identifier once logout has been clikced
                UserDefaults.standard.synchronize()
                
                let signIn = self.storyboard?.instantiateViewController(withIdentifier: "signIn") as! SignInVC
                
                let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate //inherits methods of appdelegate
                delegate.window?.rootViewController = signIn //can now cast root window from storyboard
                
            }
        }
    }
    
}

