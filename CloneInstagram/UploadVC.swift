//
//  SecondViewController.swift
//  CloneInstagram
//
//  Created by Donald Mactavish on 10/07/2018.
//  Copyright © 2018 Inverted Circle. All rights reserved.
//

import UIKit
import Parse

class UploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboardRecogniser = UITapGestureRecognizer(target: self, action: #selector(UploadVC.hideKeyboard))
        self.view.addGestureRecognizer(keyboardRecogniser)
      
    
        postImage.isUserInteractionEnabled = true
        let gestureReceogniser = UITapGestureRecognizer(target: self, action: #selector(UploadVC.choosePhoto))
        postImage.addGestureRecognizer(gestureReceogniser)
        
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
        
    }
    
    @objc func choosePhoto() {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        postImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postCommentText: UITextView!
    //@IBOutlet weak var postButton: UIButton!
    
    
    @IBAction func postButtonClicked(_ sender: Any) {
        
     let object = PFObject(className: "Posts")

        let data = UIImageJPEGRepresentation(postImage.image!, 0.5)
        let pfImage = PFFile(name: "image.jpg", data: data!)

        object["postimage"] = pfImage
        object["postcomment"] = postCommentText.text
        object["postowner"] = PFUser.current()!.username!

       let uuid = UUID().uuidString

       object["postuuid"] = "\(uuid) \(PFUser.current()!.username!)"

       object.saveInBackground { (success, error) in
        if error != nil{
            
            let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style:UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            self.postCommentText.text = ""
            self.postImage.image = UIImage(named: "select.png")
            self.tabBarController?.selectedIndex = 0
            
            
        }
        }
    }
    
}

