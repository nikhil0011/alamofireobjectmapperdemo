# alamofireobjectmapperdemo
Using alamofire with object mapper demo project 

Network request format would be :

 {
	"Login": {
 "Mobile": "9999999999",
 "Name": "Nikhil",
 "DeviceID": "37ffE8CD54-9D75-491F-A9EA-4F52AC7B709C",
 "EPAppRegID": "iOS_a926fffcfc370e1b134a8aac9f9f7b1f09e72c0bf8b955fd732a70d1fd3027fe6000"
	}
 }
 
 Response we would be consuming is :
 /n
 {
  "ErrorCode": 200,/n
  "loginResponse": {
    "OTP": "020520",
    "PreExisting": true,
    "CustomerId": 000000
  }
}


Project is tetsted with valid url and over all devices.

Note: Please change base url and endpoint according to your own use similarly you may update request or response model as per needed. 
