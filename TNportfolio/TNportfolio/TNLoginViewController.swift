//
//  TNLoginViewController.swift
//  TNportfolio
//
//  Created by Prasobh Veluthakkal on 20/12/16.
//  Copyright © 2016 Focaloid. All rights reserved.
//

import UIKit

class TNLoginViewController: UIViewController {
    
    var userEmail : String?
    var userPassword :String?
    var userEnteredEmail : String?
    var userEnteredPassword :String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func userRegisterLogin(sender: UIButton) {
        
        let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("registerVCID") as? TNRegisterTableViewController
        
        navigationController?.pushViewController(loginController!, animated: true)
    }
    
        



    
    
    @IBAction func userLoginButton(sender: UIButton) {
        let loginController = self.childViewControllers.first as? TNLoginTableViewController
        
        loginController!.setValues()
        
        var parameter = loginController?.detailsDictionary
        userEnteredEmail = parameter!["email"]
        userEnteredPassword = parameter!["password"]
        
        if userEnteredEmail == loginController?.emailText.text && userEnteredPassword == loginController?.passwordText.text
        {
        
        guard(whitespaceValidation(userEnteredEmail!) == true)
            else
        {
            return alertMessage("email id should not be blank")
        }
        
        guard(emailValidation(userEnteredEmail!) == true)
            else
        {
            return alertMessage("Invalid Email Id")
        }
        
        guard(whitespaceValidation(userEnteredPassword!) == true)
            else
        {
            return alertMessage("password should not be blank")
        }
        }
        if userEnteredEmail == loginController?.emailText.text && userEnteredPassword == loginController?.passwordText.text
        {
            let tabController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabBarVCID") as? TNTabBarViewController
            navigationController?.presentViewController(tabController!, animated: true, completion: nil)
        }

        else
        {
            
            let alertViewController = UIAlertController(title: "LOGIN",  message:"Failed", preferredStyle: .Alert)
            
            alertViewController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            presentViewController(alertViewController, animated: true, completion: nil)

        }
        
        
        
        
        
        
    }
    
    func whitespaceValidation(name:String) -> Bool
    {
        
        let whitespaceSet = NSCharacterSet.whitespaceCharacterSet()
        if !name.stringByTrimmingCharactersInSet(whitespaceSet).isEmpty
        {
            return true
        }
        else
        {
            return false
        }
        
    }
    func emailValidation(email:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailTest.evaluateWithObject(email)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    
    func alertMessage(message : String){
        let alertViewController = UIAlertController(title: "ERROR",  message:message, preferredStyle: .Alert)
        
        alertViewController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        presentViewController(alertViewController, animated: true, completion: nil)
        
    }

        
        
        
        
    }
    

