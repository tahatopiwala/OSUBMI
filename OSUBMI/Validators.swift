//
//  Validators.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/9/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import Foundation

func isValidEmailAddress(text : String) -> Bool{
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", EMAILREGEX)
    
    let result = emailTest.evaluateWithObject(text)
    
    return result
}

func isValidPhoneNumber(value: String) -> Bool {
    
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    
    let result =  phoneTest.evaluateWithObject(value)
    
    return result
    
}