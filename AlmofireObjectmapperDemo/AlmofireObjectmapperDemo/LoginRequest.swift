//
//  LoginRequest
//  IOS_Easypolicy
//
//  Created by Admin on 11/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Swift
import ObjectMapper

class LoginRequest: NSObject,Mappable {
    
    var login            : OTPModel!
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        login   <- map["Login"]
    }
}
