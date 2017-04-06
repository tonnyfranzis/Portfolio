//
//  TNRegisterTableViewController.swift
//  TNportfolio
//
//  Created by Prasobh Veluthakkal on 20/12/16.
//  Copyright © 2016 Focaloid. All rights reserved.
//

import UIKit

class TNRegisterTableViewController: UITableViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var dobText: UITextField!
    @IBOutlet weak var nationalityText: UITextField!
    @IBOutlet weak var mobileText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmText: UITextField!
    var dobPicker : UIDatePicker?
    var nationalityPicker : UIPickerView?
    var nationality : [String]?
    var nationalitySelected : String?
    var defaultEmail : String?
    var defaultPassword :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         defaultEmail = "tonyfranzis333.com"
         defaultPassword = "12345678"
        
        dobPicker = UIDatePicker()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        
        dobPicker!.datePickerMode = UIDatePickerMode.Date
        
        let dateToolBar = UIToolbar()
        dateToolBar.barStyle = UIBarStyle.Default
        dateToolBar.translucent = true
        dateToolBar.tintColor = UIColor.grayColor()
        dateToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(TNRegisterTableViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(TNRegisterTableViewController.cancelPicker))
        
        dateToolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        dateToolBar.userInteractionEnabled = true
        
        dobText.inputAccessoryView = dateToolBar
        dobText?.inputView = dobPicker
        
        nationality = ["India","England","Pakistan","China"]
        nationalityPicker = UIPickerView()
        nationalityPicker?.dataSource = self
        nationalityPicker?.delegate = self
        
        let nationalityToolBar = UIToolbar()
        nationalityToolBar.barStyle = UIBarStyle.Default
        nationalityToolBar.translucent = true
        nationalityToolBar.tintColor = UIColor.grayColor()
        nationalityToolBar.sizeToFit()
        
        let nationalityPickerDoneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(TNRegisterTableViewController.nationalityDonePicker))
        let nationalityPickerSpaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let nationalityPickerCancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(TNRegisterTableViewController.nationalityCancelPicker))
        nationalityToolBar.setItems([nationalityPickerCancelButton, nationalityPickerSpaceButton, nationalityPickerDoneButton], animated: false)
        nationalityToolBar.userInteractionEnabled = true
        
        nationalityText.inputAccessoryView = nationalityToolBar
        nationalityText?.inputView = nationalityPicker
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TNRegisterTableViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
          }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButton(sender: UIButton) {
        
        let mobileNumber = mobileText.text
        let password = passwordText.text
        let confirmPassword = confirmText.text
        let email = emailText.text
        let age = ageText.text
        let name  = nameText.text
        guard (whitespaceValidation(name!) == true)
        else
       {
        return alertMessage("name shoul not be blank")
        
        }
    
        guard (validateMobileNumber(mobileNumber!) == true)
            else
        {
            return alertMessage("mobile number is invalid")
            
        }
        guard (passwordValidation(password!) == true)
            else
        {
        return alertMessage("password invalid")
             }
        guard(confirmPasswordValidation(password!, confirmPassword: confirmPassword!) == true)
            else
        {
            return alertMessage("password mismatching")
        }
        
        guard (emailValidation(email!) == true)
            else
        {
            return alertMessage("invalid Email")
            
        }
        guard (ageValidation(age!) == true)
            else
        {
            return alertMessage("invalid age")
        }
        
        
        
        let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginVCID") as? TNLoginViewController
        loginController?.userEmail = email
        loginController?.userPassword = password
        navigationController?.pushViewController(loginController!, animated: true)

        
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
    
    func validateMobileNumber(number : String) -> Bool  {
        if number.characters.count == 10
        {
            if (Int(number) != nil)
            {
                return true
            }
            else
            {
                return false
            }
        }
        else
        {
            return false
        }
    }
    
    func passwordValidation(password: String) -> Bool {
        if password.characters.count <= 7
        {
            return false
        }
        else{
            return true
        }
    }
    
    func confirmPasswordValidation(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword{
            return true
        }
        else{
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
    
    func ageValidation(age:String) -> Bool
    {
        if (Int(age) != nil)
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
    func donePicker() {
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = ("dd-MMMM-yyyy")
        dobText.text = dateFormater.stringFromDate(dobPicker!.date)
        dobText.resignFirstResponder()
        
    }
    
    func cancelPicker() {
        dobText.resignFirstResponder()
    }

    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    func nationalityDonePicker () {
        nationalityText.text = nationalitySelected
        nationalityText.resignFirstResponder()
    }
    func nationalityCancelPicker () {
        nationalityText.resignFirstResponder()
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int
    {
        return 1
            }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nationality!.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nationality![row] as String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nationalitySelected = nationality![row]
    }

    
    
    @IBAction func loginButton(sender: UIButton) {
        
        
        let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginVCID") as? TNLoginViewController
        
        navigationController?.pushViewController(loginController!, animated: true)

        
    }
    
    
    
    }














