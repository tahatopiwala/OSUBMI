//
//  ProfileData.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/8/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import Foundation

let PROFILE_SECTIONS = ["Default", "Reminders", "Security", "Permissions and Consent" , "Privacy and License", "Log"]
let PROFILE_SECTION_ITEMS : [[String]] = [["Biological Sex","What time do you generally wake up?","What time do you generally sleep?"],["Activity Reminders"],["Auto-Lock","Change Passcode"],["Permissions","Review Consent"],["Privacy Policy","License Information"],["Sleep Log"]]


let ACTIVITY_REMINDER = ["Reminders","Summary","Morning","Noon","Evening"]
let ACTIVITY_REMINDER_STATUS = [false, true, false, true, false]

let PERMISSION_TITLE = ["HealthKit", "Location"]
let PERMISSION_DISCRIPTION = ["To get your basic information about your health to make the study more robust", "To help out to know where you are performing this study from"]
let PERMISSION_SWITCH_VALUE = [false,false]