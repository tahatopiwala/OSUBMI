//
//  PermissionsTVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/9/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class PermissionsTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // MARK: - Table view data source

    @IBAction func permissionValue(sender: UISwitch) {
        let tag = sender.tag
        switch tag {
        case 1:
            break
        case 2:
            break
        default:
            break
        }
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PERMISSION_TITLE.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(REUSABLE_CELL_ID_PERMISSION, forIndexPath: indexPath) as? PermissionsTableViewCell {
            
            let title = PERMISSION_TITLE[indexPath.row]
            let permissionDiscription = PERMISSION_DISCRIPTION[indexPath.row]
            let switchValue = PERMISSION_SWITCH_VALUE[indexPath.row]
            cell.configureCell(title, detail: permissionDiscription, value: switchValue, tag: indexPath.row)
            
            return cell
        }
        // Configure the cell...
        
        

        return UITableViewCell()
    }
 
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }

}
