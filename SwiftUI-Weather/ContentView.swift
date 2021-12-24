//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Mohamed Hammam on 16/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @State private var pushed : Bool? = false
    var xx = APIs()

    var body: some View {
        NavigationView {
        ZStack{
            backGroundView(isNight: $isNight)

            VStack{
                mainCityTextView(mainCityName: "Qwiesna, menofia")
                        
                VStack(spacing: 10){
                    mainTemperatureView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.bolt.fill", temperature: 13)
                    
                }.padding(.bottom , 40)
                    .onAppear{
                        print("**** on appear *****")
                                                self.xx.userRegisteration(Email: "moh@mail.com", Phone: "00001111000", Password: "0011", Name: "moh", UserTypeId: 2) { error, status, message in
                            print("loggedin")
                            
                        }
                    }
                
                HStack (spacing: 20){
                    WeatherDayView(dayOfWeek: "mon", imageName: "cloud.rain.fill", temprature: 15)
                    WeatherDayView(dayOfWeek: "tue", imageName: "wind.snow", temprature: 22)
                    WeatherDayView(dayOfWeek: "wed", imageName: "sun.max.fill", temprature: 50)
                    WeatherDayView(dayOfWeek: "thu", imageName: "cloud.sun.bolt.fill", temprature: 33)
                    WeatherDayView(dayOfWeek: "fri", imageName: "snowflake", temprature: 08)
                }
                Spacer()
  
                ZStack {
                    NavigationLink( destination: LoginView(),tag: true, selection: $pushed){
                    
                    Button{
                        //Button Action
                        isNight.toggle()
                        self.pushed = true
                        
                    }label:{
                        WeatherButton(buttonTitle: "Change Day Time", buttonTitleColor: .blue, buttonBackgroundColor: .white)
                    }}
                }
                Spacer()
                
            }

        }.navigationTitle("today's Weather")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temprature: Int

    var body: some View {

        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(Color.white)
            
            VStack(spacing: 10){
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40 , height: 40)
                
                Text("\(temprature)°")
                    .font(.system(size: 28
                                  , weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
        }
    }
}

struct backGroundView: View {
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
 
struct mainCityTextView : View{
    var mainCityName : String
    
    var body: some View{
        Text(mainCityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct mainTemperatureView : View{
    var imageName : String
    var temperature : Int

    var body: some View{
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)

        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct WeatherButton : View {
    var buttonTitle : String
    var buttonTitleColor : Color
    var buttonBackgroundColor : Color
    
    var body: some View {
        Text(buttonTitle)
            .frame(width: 200, height: 50)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(buttonTitleColor)
            .background(buttonBackgroundColor)
            .cornerRadius(12)

    }
}
