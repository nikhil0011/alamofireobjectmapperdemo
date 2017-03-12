//
//  OTPResponse.swift
//  IOS_Easypolicy
//
//  Created by Admin on 11/5/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Swift
import ObjectMapper

class OTPResponse: NSObject,Mappable {
        
        var errorCode          : Int!
        var loginResponse      : LoginResponse!
    
        override init() {
            super.init()
        }
        
        convenience required init?(map: Map){
            self.init()
        }
        
        func mapping(map: Map) {
           errorCode        <- map["ErrorCode"]
           loginResponse    <- map["loginResponse"]
        }
}
