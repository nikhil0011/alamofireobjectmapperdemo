
//  LoginResponse.swift
//  IOS_Easypolicy
//
//  Created by Admin on 11/5/16.
//  Copyright © 2016 Admin. All rights reserved.

import Foundation
import ObjectMapper

class LoginResponse: NSObject,Mappable {
    
    var OTP              : String!
    var preExisting      : Bool!
    var customerId       : Int!
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        OTP            <- map["OTP"]
        preExisting    <- map["PreExisting"]
        customerId     <- map["CustomerId"]
    }
}
