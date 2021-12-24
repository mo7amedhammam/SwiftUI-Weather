//
//  LoginView.swift
//  SwiftUI-Weather
//
//  Created by Mohamed Hammam on 18/12/2021.
//


import SwiftUI
import Alamofire

struct LoginView: View {
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    @State var username: String = ""
    @State var password: String = ""
//    var login:login
let log = APIs()
    
    var body: some View {
        
        
        VStack{
            
            loginImage().padding(.top,50).padding(.bottom, 20)
            TextField("Username", text: $username)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                        SecureField("Password", text: $password)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .onAppear{
                                self.log.userRegisteration(Email: "moh@mail.com", Phone: "00001111000", Password: "0011", Name: "moh", UserTypeId: 2) { error, status, message in
                                    print("loggedin")
                                    
                                }
                                
                                var userobj : CreatUserMode?
                                
                        //        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.getAccessToken() ]
                                let header : HTTPHeaders = [ "content-type" : "application/json"  , "accept" : "text/plain" ]

                                let parameters : [String : Any] = ["Email" : "mo@gmail.com" ,"Phone" : "000111" ,"Password" : "0011" ,"Name" : "Name" ,"UserTypeId" : 2 ]
                                
                                let url = URLs.CreateUser
                                //        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.getAccessToken() ]
                                AF.request(url, method: .post, parameters: parameters, headers: header)
                                    .responseJSON{ response in
                                        
                                        do{
                                            let user = try JSONDecoder().decode(CreatUserMode.self, from: response.data!)
                                            userobj = user
                                            print(userobj!)
                                            
                                        } catch{
                                            
                                        }
                                    }

                                
                            }
            
            
            Button(action: {

                
                var userobj : CreatUserMode?
                
        //        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.getAccessToken() ]
                let header : HTTPHeaders = [ "content-type" : "application/json"  , "accept" : "text/plain" ]

                let parameters : [String : Any] = ["Email" : "mo@gmail.com" ,"Phone" : "000111" ,"Password" : "0011" ,"Name" : "Name" ,"UserTypeId" : 2 ]
                
                let url = URLs.CreateUser
                //        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.getAccessToken() ]
                AF.request(url, method: .post, parameters: parameters, headers: header)
                    .responseJSON{ response in
                        
                        do{
                            let user = try JSONDecoder().decode(CreatUserMode.self, from: response.data!)
                            userobj = user
                            print(userobj!)
                            
                        } catch{
                            
                        }
                    }

                
             
                
            }, label: {
                Text("LOGIN")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.green)
                                .cornerRadius(15.0)

            })
            Spacer()
            HStack(spacing: 0) {
                            Text("Don't have an account? ")
                            Button(action: {}) {
                                Text("Sign Up")
                                    .foregroundColor(.black)
                            }
                        }

        }.padding()
    .background(
        LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
    }
}
class login{
func loginFunc (){
    print("login tapped from function")
}
}


struct loginImage : View{
    var body : some View {
        
        return Image("download")
            .resizable()
            .aspectRatio(UIImage(named: "download")!.size, contentMode: .fill)
            .frame(width: 150, height: 150)
            .cornerRadius(150)
            .clipped()
            .padding(.leastNormalMagnitude)
//            .padding(.bottom,1)

    }
}
