//
//  EligibilityVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/7/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class EligibilityVC: UITableViewController {

    var EligibilityRequirement : [Bool] = [false, false, false, false]
    var isEligible : Bool = false
    
    @IBOutlet weak var proceedToConsentButton: UIBarButtonItem!
    
    // MARK :- Display Cycle Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.rightBarButtonItem?.enabled = false
        self.navigationController?.navigationBarHidden = false
    }

    
    @IBAction func proceedToConsent(sender: AnyObject) {
        let vc = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_CONSENT)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func toggleEligibility(button: UIButton){
        let typeEligibility = button.tag
        
        switch typeEligibility {
        
        case 1,2:
            if typeEligibility == 1 {
                EligibilityRequirement[0] = true
                self.changeButtonView(2)
            }else{
                
                EligibilityRequirement[0] = false
                self.changeButtonView(1)
            }
            break
        case 3,4:
            if typeEligibility == 3 {
                EligibilityRequirement[1] = true
                self.changeButtonView(4)
            }else{
                
                EligibilityRequirement[1] = false
                self.changeButtonView(3)
            }
            break
        case 5,6:
            if typeEligibility == 5 {
                EligibilityRequirement[2] = true
                self.changeButtonView(6)
            }else{
                
                EligibilityRequirement[2] = false
                self.changeButtonView(5)
            }
            break
        case 7,8:
            if typeEligibility == 7 {
                EligibilityRequirement[3] = true
                self.changeButtonView(8)
            }else{
                EligibilityRequirement[3] = false
                self.changeButtonView(7)
            }
            break
        default:
            self.checkForProceedConsent()
            break
            
        }
        
        UIView.animateWithDuration(0.5) {
            button.layer.opacity = ELIGIBILITY_TRUE_OPACITY
            button.tintColor = ELIGIBILITY_TRUE_TINT_COLOR
            button.layer.borderColor = ELIGIBILITY_TRUE_BORDER_COLOR
        }
        
    }
    
    func changeButtonView(tag : Int){
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.layer.opacity = ELIGIBILITY_FALSE_OPACITY
            button.tintColor = ELIGIBILITY_FALSE_TINT_COLOR
            button.layer.borderColor = ELIGIBILITY_FALSE_BORDER_COLOR
        }
        self.checkForProceedConsent()
    }
    
    func checkForProceedConsent(){
        if checkIfEligible() {
            isEligible = true
        }else{
            isEligible = false
        }
        
        self.updateNavigationBarRightButton()
    }
    
    func updateNavigationBarRightButton(){
        if isEligible{
            self.navigationItem.rightBarButtonItem?.enabled = true
        }else{
            self.navigationItem.rightBarButtonItem?.enabled = false
        }
    }
    
    func checkIfEligible() -> Bool{
        for value in EligibilityRequirement {
            if value == false{
                return false
            }
        }
        return true
    }
}
