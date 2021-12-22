//
//  LoginView.swift
//  SwiftUI-Weather
//
//  Created by Mohamed Hammam on 18/12/2021.
//

import SwiftUI

struct LoginView: View {
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    @State var username: String = ""
    @State var password: String = ""
    
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

            
            
            Button(action: {
                loginFunc()
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
func loginFunc (){
    print("login tapped from function")
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
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
