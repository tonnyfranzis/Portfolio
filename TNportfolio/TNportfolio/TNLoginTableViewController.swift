//
//  TNLoginTableViewController.swift
//  TNportfolio
//
//  Created by Prasobh Veluthakkal on 21/12/16.
//  Copyright © 2016 Focaloid. All rights reserved.
//

import UIKit

class TNLoginTableViewController: UITableViewController {

    
    
    @IBOutlet weak var emailText: UITextField!
   
    
    @IBOutlet weak var passwordText: UITextField!
    
    var detailsDictionary = [String:String] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsDictionary["email"] = ""
        detailsDictionary["password"] = ""
        
          emailText.text = "tonyfranzis333@gmail.com"
          passwordText.text = "12345678"
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TNRegisterTableViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        

        
    }
    
    
    
func dismissKeyboard() {
    
    view.endEditing(true)
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   func setValues()
{
    detailsDictionary["email"] = emailText.text
    detailsDictionary["password"] = passwordText.text
}


}
