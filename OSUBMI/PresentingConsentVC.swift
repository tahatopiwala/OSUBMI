//
//  PresentingConsentVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/7/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit
import ResearchKit

class PresentingConsentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.presentConsentDocument()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
    }

    func presentConsentDocument(){
    
        let consentTask = ORKTaskViewController(task: Consent, restorationData: nil, delegate: self)
        self.presentViewController(consentTask, animated: true) { 
            print("Consent task has been shown and begun")
        }
    }

}

extension PresentingConsentVC : ORKTaskViewControllerDelegate {
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
        switch reason {
            
        case .Completed:
            print(taskViewController.result)
            break
        case .Discarded:
            
            break
        case .Failed:
            
            break
        default:
            print("There seems to be an issue")
        
        }
        
        taskViewController.dismissViewControllerAnimated(true) { 
            print("Consent Document Has Been Completed")
        }
    }
    
}