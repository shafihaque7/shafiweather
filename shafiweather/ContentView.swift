//
//  ContentView.swift
//  shafiweather
//
//  Created by Shafi Haque on 6/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"), isNight: isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                VStack(spacing: 10){
                    Image(systemName: isNight ? "moon.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                    
                    HStack(spacing: 20) {
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                        WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                        WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55)
                        WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                        WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
                        
                    }
            
                    
                    Spacer()
                    Button {
                        print("tapped")
                        isNight.toggle()
                        
                    } label: {
                        Text("Change Day Time")
                            .frame(width: 280, height: 50)
                            .background(Color.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .cornerRadius(10.0)
                    }
                Spacer()
                
                }
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
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size:16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var isNight: Bool
    
    var body: some View {
        
        
        LinearGradient(gradient: Gradient(colors: [isNight ? Color.black: topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
    
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    var isNight: Bool
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: isNight ? "moon.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 180, height: 180)
            Text("76°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
        
    }
}
