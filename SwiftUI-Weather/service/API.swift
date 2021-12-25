//
//  API.swift
//  SwiftUI-Weather
//
//  Created by Mohamed Hammam on 24/12/2021.
//

import Foundation
import Alamofire

//struct params : Codable {
//  let Email : String
//    let Phone : String
//    let Password : String
//    let Name : String
//    let UserTypeId : Int
//}
class APIs : NSObject {
    
    //MARK: --------- Register  --------
    /// -------------------- creat new user  -------------
     func  userRegisteration ( Email : String ,Phone : String ,Password : String ,Name : String ,UserTypeId : Int , completion : @escaping (_ error : Error? , _ status : Int ,_ message : String? ) ->Void) {
        
         print("func here is >>>>>>>>>>>>>")

        var userobj : CreatUserMode?

//        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.getAccessToken() ]
        let header : HTTPHeaders = [ "content-type" : "application/json"  , "accept" : "text/plain" ]

        let parameters : [String : Any] = ["Email" : Email ,"Phone" : Phone ,"Password" : Password ,"Name" : Name ,"UserTypeId" : UserTypeId ]
        
        let url = URLs.CreateUser
        //        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.getAccessToken() ]
         AF.request(url, method: .post, parameters: parameters, headers: header)
            .responseJSON{ response in
                print("response is >>>>>>>>>>>>>")

                print(response)
       
                print("data is >>>>>>>>>>>>>")

                print(response.data!)
                
                print("result is >>>>>>>>>>>>>")

                print(response.result)
                do{
                    let user = try JSONDecoder().decode(CreatUserMode.self, from: response.data!)
                    userobj = user
//                    debugPrint(response.data!)
                    print("json is >>>>>>>>>>>>>")
                    print(user)
                    print(userobj?.email ?? "ema")

                    print(userobj!)
                    
                } catch{
                    print("catch is heres >>>>>>>>>>>>>")

                }
                
//                switch response.result {
//                case .failure(let error) :
//                    completion(error , 1  , "" )
//                case .success(let value) :
//                    let json = JSON(value)
//                    print(json)
//
//                    if json["Success"] == 0 && json["Message"] == "Phone and email already registed "{
//                        completion(nil , 0 ,json["Message"].string ?? "")
//                    } else {
//                        completion(nil , -1 ,json["Message"].string ?? "")
//
//                    }
//
//                }
            }
    }
    
}
