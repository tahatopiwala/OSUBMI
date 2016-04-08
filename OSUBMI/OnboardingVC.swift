//
//  OnboardingVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/6/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit
import HealthKit

class OnboardingVC: UIViewController {

    
    let healthStore = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        preparingHealthKit()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    func preparingHealthKit(){
    
        if HKHealthStore.isHealthDataAvailable(){
            print("Health data is there")
            let readData = self.readHealthDataPermission()
            healthStore.requestAuthorizationToShareTypes(nil, readTypes: readData, completion: { (success, error) in
                if !success {
                    print("There seems to be an error in reading your Health Data.")
                }
            })
        }else{
            print("There is no health data available.")
        }
    
    }
    
    func readHealthDataPermission() -> Set<HKSampleType> {
        var set = Set<HKSampleType>()
        let height = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)
        let weight = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        set.insert(weight!)
        set.insert(height!)
        return set
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

}
