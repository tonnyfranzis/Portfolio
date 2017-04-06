//
//  TNAboutMeTableViewController.swift
//  TNportfolio
//
//  Created by Prasobh Veluthakkal on 28/12/16.
//  Copyright © 2016 Focaloid. All rights reserved.
//

import UIKit

class TNAboutMeTableViewController: UITableViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.blackColor().CGColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Table view data source

    
    @IBAction func mobileNumber(sender: UIButton) {
        if let phoneCallURL = NSURL(string: "tel:\(9061236846)") {
            let application = UIApplication.sharedApplication()
            if application.canOpenURL(phoneCallURL) {
                application.openURL(phoneCallURL)
            }
            else{
                print("failed")
            }
        }
    }
    
    @IBAction func website(sender: UIButton)
    {
        if let url = NSURL(string: "https://tonyfranzis333.wixsite.com/mysite") {
            UIApplication.sharedApplication().openURL(url)
        }
    }

    }
