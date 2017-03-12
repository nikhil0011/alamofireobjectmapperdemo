//
//  ViewController.swift
//  AlmofireObjectmapperDemo
//
//  Created by Admin on 3/12/17.
//  Copyright © 2017 Admin. All rights reserved.
//

/*
 Smaple JSON Request format is 
 
 {
	"Login": {
 "Mobile": "8802516503",
 "Name": "Nikhil",
 "DeviceID": "37E8CD54-9D75-491F-A9EA-4F52AC7B709C",
 "EPAppRegID": "iOS_a926cfc370e1b134a8aac9f9f7b1f09e72c0bf8b955fd732a70d1fd3027fe6000"
	}
 }
 
 
 */

import UIKit
import Alamofire
import ObjectMapper
import SVProgressHUD
import AlamofireObjectMapper

class ViewController: UIViewController {
    let EPAppRegID = "iOS_a926cfc370e1b134a8aac9f9f7b1f09e72c0bf8b955fd732a70d1fd3027fe6000"
    var loginResponse : LoginResponse!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func makeLoginRequest(_ sender: Any) {
        let loginAPIManager = LoginAPIManager()
        //calling method in LoginAPIManager class
        //with static parameters
        loginAPIManager.generateOTPService(name: "Nikhil",epAppRegID: AppRegID, mobile: "9999999999", success: { (data) -> Void in
            SVProgressHUD.dismiss()
            self.loginResponse = data!
            print("otp",self.loginResponse.OTP)
           
        /*
            DispatchQueue.main.async {
            // any segue task you may want to perform  
            }
                */
            
        }, failure: { (data) -> Void in
            SVProgressHUD.dismiss()
        })

    }

}

