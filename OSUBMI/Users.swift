//
//  Users.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/10/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import Foundation
import AWSDynamoDB

class User {
    
    var ID : String!
    var FirstName : String!
    var LastName : String!
    var Email : String!
    var Location : String!
    var USERObject : UsersDynamoDB = UsersDynamoDB()
    
    init(id : String, firstname : String, lastname : String, email : String, location : String){
    
        self.ID = id
        self.FirstName = firstname
        self.LastName = lastname
        self.Email = email
        self.Location = location
        
        initUserObject()
    }
    
    func initUserObject(){
        USERObject.ID = self.ID
        USERObject.FirstName = self.FirstName
        USERObject.LastName = self.LastName
        USERObject.Email = self.Email
        USERObject.Location = ["1","2"]
    }
}

class UsersDynamoDB : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var ID : String?
    var FirstName : String?
    var LastName : String?
    var Email : String?
    var Location : [String]?
    
    static func dynamoDBTableName() -> String! {
        return "RKUSERS"
    }
    
    static func hashKeyAttribute() -> String! {
        return "ID"
    }
}