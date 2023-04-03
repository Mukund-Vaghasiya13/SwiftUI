//
//  ContentView.swift
//  basic
//
//  Created by Mukund vaghasiya  on 24/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
     
    var body: some View {
        ZStack{
            BackGroundColor(firstColor: isNight ? .black:.blue, secondColor:isNight ? .gray:.indigo)
            VStackLayout(spacing: 30){
                Text("India")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                
                CityViewTemp(imageName: isNight ?  "moon.stars.fill": "cloud.sun.rain.fill" )
                
                HStack(spacing:20){
                    ExtractedView(name: "Tue", image:"sun.max.fill" , text: 30)
                    ExtractedView(name: "Wed", image:"cloud.heavyrain.fill" , text: 40)
                    ExtractedView(name: "Thru", image:"thermometer.sun.fill" , text: 80)
                    ExtractedView(name: "Sat", image:"cloud.sun.bolt.fill" , text: 37)
                    ExtractedView(name: "Sun", image:"smoke.fill" , text: 25)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                                   
                } label: {
                    ButtonViewDesign()
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

struct ExtractedView: View {
    
    var name:String
    var image:String
    var text:Int
    
    var body: some View {
        VStack{
            Text(name)
                .font(.system(size: 30).bold())
                .foregroundColor(.white)
            
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50 ,height: 50)
            
            Text("\(text)°")
                .font(.system(size: 17).bold())
                .foregroundColor(.white)
        }
    }
}

struct BackGroundColor: View {
    var firstColor:Color
    var secondColor:Color
    
    var body: some View {
        LinearGradient(colors: [firstColor,secondColor], startPoint: .topTrailing, endPoint: .bottomLeading)
            .ignoresSafeArea()
    }
}

struct CityViewTemp: View {
    var imageName:String
    var body: some View {
        VStack(){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200,height: 200)
            
            Text("36°")
                .font(.system(size: 70))
                .foregroundColor(.white)
            
                .padding(.top)
            
        }
    }
}

struct ButtonViewDesign: View {
    
    var body: some View {
        Text("Change Day Time")
            .font(.system(size: 20,weight: .heavy))
            .foregroundColor(.blue)
            .frame(width:300,height: 50)
            .background(Color.white)
            .cornerRadius(10)
    }
}
