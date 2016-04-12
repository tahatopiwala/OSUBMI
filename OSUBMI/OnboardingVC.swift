//
//  OnboardingVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/6/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit
import LocalAuthentication

class OnboardingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    func loadJSON(){

        let path = NSBundle.mainBundle().pathForResource("test", ofType: "json")
        if let data = NSData(contentsOfFile: path!){
            do{
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let dic = object as? Dictionary<String, AnyObject>{
                    guard let _ = dic["questions"], let _ = dic["logo_name"] else { return }
                    
                }
                
            }catch{
                
            }
        }
        
    }
    
    @IBAction func toAccountCreate(sender: AnyObject) {
        let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_CREATEACCOUNT)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func toElgibilityAndConsent(sender: AnyObject) {
        let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_ELIGIBILITY)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func toSignIn(sender: AnyObject) {
        let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewControllerWithIdentifier(STORYBOARD_ID_LOGIN)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func enableTouch(sender: AnyObject) {
        let context = LAContext()
        var error : NSError?
        if context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate Please!", reply: { (success, error) in
                if success {
                    print("You are the owner")
                }else{
                    
                }
            })
        }
        
    }
    

}
