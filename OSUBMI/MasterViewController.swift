//
//  MasterViewController.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/6/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//  Sysnopsis - Acts as primary viewcontroller to check for current application state Logged In / Logged Out

import UIKit

class MasterViewController: UIViewController {
    
    override func viewDidLoad() {
        dispatch_async(dispatch_get_main_queue()) { 
            self.toAccount()
        }
    }
    
    func toOnboardController(){
        self.performSegueWithIdentifier(SEGUE_TO_ONBOARD, sender: self) // Send to Onboarding
    }
    
    func toAccount(){
        self.performSegueWithIdentifier(SEGUE_TO_ACCOUNT, sender: self) // Send to Profile
    }
    
}