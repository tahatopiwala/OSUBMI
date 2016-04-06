//
//  MasterViewController.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/6/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    override func viewDidLoad() {
        dispatch_async(dispatch_get_main_queue()) { 
            self.toOnboardController()
        }
    }
    
    func toOnboardController(){
        self.performSegueWithIdentifier(SEGUE_TO_ONBOARD, sender: self)
    }
    
    func toProfile(){
        self.performSegueWithIdentifier(SEGUE_TO_PROFILE, sender: self)
    }
    
}