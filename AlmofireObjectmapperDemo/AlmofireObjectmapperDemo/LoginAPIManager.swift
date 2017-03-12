//
//  LoginAPIManager.swift
//  IOS_Easypolicy
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Swift
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SVProgressHUD

public class LoginAPIManager {
    var otp : Int! = 0
    let DEVICE_ID: String! = "37E8BJHDFBFJDBJKCD54-9D75-491F-A9EA-4F52AC7B709C"
    func generateOTPService(name : String,epAppRegID: String, mobile: String, success: @escaping (_ data: LoginResponse?) -> Void,failure: @escaping (_ _data: AnyObject?) -> Void) -> Void{
        let otpGenratorModel              = LoginRequest()
        otpGenratorModel.login            = OTPModel()
        otpGenratorModel.login.mobile     = mobile
        otpGenratorModel.login.deviceID   = DEVICE_ID
        otpGenratorModel.login.name       = name
        otpGenratorModel.login.epAppRegID = epAppRegID
        let i = Mapper<LoginRequest>().toJSON(otpGenratorModel)
        debugPrint("request sent",i)
        let otpResponse = OTPResponse()
        SVProgressHUD.show(withStatus: "Loading")
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.setRingThickness(0.8)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        //network request to generate OTP
        Alamofire.request(BASE_URL + END_POINT, method: .post, parameters: i, encoding: JSONEncoding.default).responseObject( mapToObject: otpResponse) { responseObj in
            //switch to valide response
            switch responseObj.result{
            case .success(_):
                //print("otp respoose",otpResponse.errorCode)
                //nested switch to validate response code
                switch otpResponse.errorCode{
                case SUCCESS_CODE?:
                    DispatchQueue.global(qos: .background).async {
                        success(otpResponse.loginResponse)
                    }
                    break
                case DEFAULT_ERR_CODE?:
                        SVProgressHUD.dismiss()
                        debugPrint(errText + errSubtext)
                    failure("default error" as AnyObject?)
                    break
                case TIMEOUT_ERR?:
                    SVProgressHUD.dismiss()
                    debugPrint(timeOutErr + errSubtext)
                    failure("Timeout error" as AnyObject?)
                    break
                default :
                    SVProgressHUD.dismiss()
                    debugPrint(errText + errSubtext)
                    failure("default error" as AnyObject?)
                    
                    break
                }
                break
            case .failure(let error):
                SVProgressHUD.dismiss()
                guard (error as NSError?) != nil else{
                    return
                }
                debugPrint(error.localizedDescription)
                break
            }
        }
    }
    
}
