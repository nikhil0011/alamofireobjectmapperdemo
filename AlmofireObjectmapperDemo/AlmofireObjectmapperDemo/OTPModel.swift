//
//  OTPModel.swift
//  IOS_Easypolicy
//
//  Created by Admin on 11/5/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Swift
import ObjectMapper

class OTPModel: NSObject,Mappable {
    
    var name            : String!
    var mobile          : String!
    var deviceID        : String!
    var epAppRegID      : String!
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        mobile    <- map["Mobile"]
        name        <- map["Name"]
        deviceID    <- map["DeviceID"]
        epAppRegID  <- map["EPAppRegID"]
    }
}
