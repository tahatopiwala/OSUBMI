//
//  Constants.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/6/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import Foundation
import UIKit

// MARK :- Color Value

let ELIGIBILITY_FALSE_TINT_COLOR = UIColor.lightGrayColor()
let ELIGIBILITY_FALSE_BORDER_COLOR = UIColor.blackColor().CGColor
let ELIGIBILITY_FALSE_OPACITY : Float = 0.5

let ELIGIBILITY_TRUE_TINT_COLOR = UIColor(red: 51/255, green: 102/255, blue: 204/255, alpha: 1)
let ELIGIBILITY_TRUE_BORDER_COLOR =  UIColor(red: 51/255, green: 102/255, blue: 204/255, alpha: 1).CGColor
let ELIGIBILITY_TRUE_OPACITY : Float = 1

// MARK :- Completion Handlers

typealias DOWNLOAD_COMPLETER_VOID = () -> ()
typealias DOWNLOAD_COMPLETE_BOOL = () -> (Bool)

// MARK :- SEGUE NAMES

let SEGUE_TO_ONBOARD = "toOnboard"
let SEGUE_TO_LOGIN = "toLogin"
let SEGUE_TO_ELIGIBILITY = "toEligibility"
let SEGUE_TO_CONSENT = "toConsent"

let SEGUE_TO_ACCOUNT = "toAccount"
let SEGUE_TO_PROFILE = "toProfile"

// MARK :- Storyboard ID's

let STORYBOARD_ID_ELIGIBILITY = "eligibility"
let STORYBOARD_ID_CONSENT = "PresentingConsentVC"
let STORYBOARD_ID_CREATEACCOUNT = "AccountCreateVC"