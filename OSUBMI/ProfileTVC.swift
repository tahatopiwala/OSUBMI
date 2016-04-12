//
//  ProfileTVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/8/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit
import MessageUI

class ProfileTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectNewImage(sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Profile Picture", message: nil, preferredStyle: .ActionSheet)
        let new = UIAlertAction(title: "Take new pciture", style: .Default) { (action) in
            
        }
        
        let delete = UIAlertAction(title: "Delete profile pciture", style: .Destructive) { (action) in
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alert.addAction(new)
        alert.addAction(delete)
        alert.addAction(cancel)
        
        
        self.presentViewController(alert, animated: true) {
            
        }
    }
    
    @IBAction func signOut(sender: UITapGestureRecognizer) {
        let answer = alertUser("Are you sure you want to sign out?")
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return PROFILE_SECTIONS.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PROFILE_SECTION_ITEMS[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let title = PROFILE_SECTION_ITEMS[indexPath.section][indexPath.row]

        
        if indexPath.section == 2 && indexPath.row == 0{
            
            if let cell = tableView.dequeueReusableCellWithIdentifier(REUSABLE_CELL_ID_PROFILE_SWITCH, forIndexPath: indexPath) as? ProfileSwitchTableViewCell{
                
                cell.configureCell(title, tag: 0, value: true)
                
                if indexPath.section == 0 {
                    cell.accessoryType = UITableViewCellAccessoryType.None
                }
                return cell
            }

        }else{
            if let cell = tableView.dequeueReusableCellWithIdentifier(REUSABLE_CELL_ID_PROFILE, forIndexPath: indexPath) as? ProfileTableViewCell{
                
                cell.configureCell(title)
                
                if indexPath.section == 0 {
                    cell.accessoryType = UITableViewCellAccessoryType.None
                }
                return cell
            }

        }
        
        
        // Configure the cell...

        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return PROFILE_SECTIONS[section]
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.section {
        case 1:
            if let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_REMINDER) as? ReminderTVC {
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            break
        case 2:
            break
        case 3:
            if indexPath.row == 0 {
                if let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_PERMISSION) as? PermissionsTVC {
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
            }else{
                toggleConsentInfo()
            }
            
            break
        case 4:
            if indexPath.row == 0{
                if let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_PRIVARY) as? PrivacyVC {
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
            }else{
                if let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_LICENSE) as? LicenseVC{
                    
                    self.navigationController?.pushViewController(vc, animated: true) 

                }
            }
            break
        case 5:
            if let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_LOG) as? SleepVC{
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            break
        default:
            break
        }
    }
 
    @IBAction func leaveStudy(sender: AnyObject) {
        let answer = alertUser("Are you sure you want to leave this study?")
    }
    
    func alertUser(message : String) -> Bool{
        
        let alert = UIAlertController(title: "Exit", message: message, preferredStyle: .Alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            alert.dismissViewControllerAnimated(true, completion: { return false })
        }
        
        let leave = UIAlertAction(title: "Leave", style: .Destructive) { (action) in
            alert.dismissViewControllerAnimated(true, completion: { return true })
        }
        
        alert.addAction(cancel)
        alert.addAction(leave)
        
        self.presentViewController(alert, animated: true) {
            print("Alert Shown")
        }
        return false
    }
    
    func toggleConsentInfo(){
    
        let alert = UIAlertController(title: "Consent", message: "Review or Email Consent", preferredStyle: .ActionSheet)
        
        let email = UIAlertAction(title: "Email Consent", style: .Default) { (action) in
            self.sendConsentViaEmail()
        }
        
        let review = UIAlertAction(title: "Review Consent", style: .Default) { (action) in
            self.displayConsent()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            
            alert.dismissViewControllerAnimated(true, completion: { 
                print("Dismissed View Coontroller")
            })
        }
        
        alert.addAction(email)
        alert.addAction(review)
        alert.addAction(cancel)
        
        self.presentViewController(alert, animated: true) { 
            print("Showing consent options")
        }
    
    }

}

extension ProfileTVC : MFMailComposeViewControllerDelegate {
    
    func sendConsentViaEmail(){
        let picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        
        self.presentViewController(picker, animated: true) { 
            print("Consent Email View Controller Shown")
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        self.dismissViewControllerAnimated(true) { 
            print("Dissmissing Mail View Controller")
        }
    }
    
    func displayConsent(){
    
        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_CONSENTDISPLAY)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
