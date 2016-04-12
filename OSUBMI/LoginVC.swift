//
//  LoginVC.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/8/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK :- Outlets
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var blurView: Material_Blur_View!

    @IBOutlet weak var blurViewPad: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func performSignIn(sender: AnyObject) {
        if email.text?.isEmpty == false {
            if password.text?.isEmpty == false {
                
            }else{
                
                vibrate({
                    self.colorAndDeColor()
                })
            }
        }else{
            vibrate({ 
                self.colorAndDeColor()
            })
        }
    }
    
    @IBAction func cancelSignIn(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func vibrate(completed:()->()){
        let animation = CABasicAnimation(keyPath: "position")
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.duration = 0.07
        animation.fromValue = NSValue(CGPoint: CGPointMake(self.blurView.center.x-10, self.blurView.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(self.blurView.center.x+10, self.blurView.center.y))
        self.blurView.layer.addAnimation(animation, forKey: "position")
        self.blurViewPad.layer.addAnimation(animation, forKey: "postion")
        completed()
    }
    
    func colorAndDeColor(){
        UIView.animateWithDuration(1, animations: {
            self.email.layer.borderWidth = 1.0
            self.email.layer.cornerRadius = 5
            self.email.layer.borderColor = UIColor.redColor().CGColor
            self.password.layer.borderWidth = 1.0
            self.password.layer.cornerRadius = 5
            self.password.layer.borderColor = UIColor.redColor().CGColor
        })
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            UIView.animateWithDuration(1, animations: {
                self.email.layer.borderWidth = 0
                self.password.layer.borderWidth = 0
            })
        }
    }
}
