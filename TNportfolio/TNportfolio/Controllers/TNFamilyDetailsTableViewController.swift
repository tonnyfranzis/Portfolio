//
//  TNFamilyDetailsTableViewController.swift
//  TNportfolio
//
//  Created by Prasobh Veluthakkal on 29/12/16.
//  Copyright © 2016 Focaloid. All rights reserved.
//

import UIKit

class TNFamilyDetailsTableViewController: UITableViewController {
    var sectionContent : [String]?
    var familyDetails : [[String]]?
    var keyArray : [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        title = "Family Details"
        sectionContent = ["Parents","Siblings"]
        familyDetails = [["joseph","mariayam"],["Rony","Tony","Tom"]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (sectionContent?.count)!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (familyDetails![section].count)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionString =  sectionContent![section]
        return sectionString
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.textLabel!.text = familyDetails![indexPath.section][indexPath.row]
        return cell
    }
    
   
}
