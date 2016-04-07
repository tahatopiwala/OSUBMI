//
//  OnboardingVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/6/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadJSON()
    }
    
    func loadJSON(){

        let path = NSBundle.mainBundle().pathForResource("test", ofType: "json")
        if let data = NSData(contentsOfFile: path!){
            do{
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let dic = object as? Dictionary<String, AnyObject>{
                    guard let _ = dic["questions"], let _ = dic["logo_name"] else { return }
                    print(dic)
                }
                
            }catch{
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
