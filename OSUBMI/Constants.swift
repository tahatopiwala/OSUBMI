//
//  Constants.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/6/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import Foundation

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