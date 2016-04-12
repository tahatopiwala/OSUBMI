//
//  ReminderTVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/9/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class ReminderTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ACTIVITY_REMINDER.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(REUSABLE_CELL_ID_REMINDER, forIndexPath: indexPath) as? ProfileSwitchTableViewCell{
        
            let title = ACTIVITY_REMINDER[indexPath.row]
            let value = ACTIVITY_REMINDER_STATUS[indexPath.row]
            cell.configureCell(title, tag: indexPath.row, value : value)
            
            return cell
        }
        
        return UITableViewCell()
    }

    @IBAction func toggleNotification(sender: UISwitch) {
        switch sender.tag {
        case 0:
        
            break
        case 1:
            
            break
        case 2:
            
            break
        case 3:
            
            break
        case 4:
            
            break
        default:
            
            break
        }
    }
    
    @IBAction func moreReminders(sender: AnyObject) {
        print("More about Reminder")
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
