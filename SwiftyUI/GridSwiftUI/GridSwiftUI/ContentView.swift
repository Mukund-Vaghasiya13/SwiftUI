//
//  ContentView.swift
//  GridSwiftUI
//
//  Created by Mukund vaghasiya  on 07/04/23.
//

import SwiftUI

struct ContentView: View {
    var columns:[GridItem] = [
    
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil)
    
    ]
    var rowsGrid:[GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: nil),
    ]
   @State private var press = true
    
    var body: some View {
        ScrollView{
            VStack{
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 400,height: 400)
                    .overlay {
                        VStack(alignment: .leading){
                            Profile()
                            Text("MUKUND")
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                                .frame(width: 100,height: 30)
                                .padding(.leading)
                            ButtonsProflie()
                            
                            Text("Stroy Highlights")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            Text("Keep your favourit stories on your profile")
                                .font(.system(size: 20))
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    ForEach(0..<10){ item in
                                        Circle()
                                    }
                                }
                            }
                            Spacer()
                    }.padding(.leading)
                     
                }
                LazyVGrid(columns: columns) {
                    
                    ForEach(0..<51){ item in
                        Rectangle()
                            .frame(height: 150)
                            .onTapGesture {
                               print("\(item) clicked")
                         }
                     }
                 }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Profile: View {
    var body: some View {
        HStack(spacing: 10){
            Image("df0")
                .resizable()
                .frame(width: 100,height: 100)
                .cornerRadius(100)
                .padding()
            
            VStack(spacing:10){
                Text("0")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                
                Text("Posts")
            }
            VStack(spacing:10){
                Text("79")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                
                Text("Followers")
            }
            VStack(spacing:10){
                Text("80")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                
                Text("Following")
            }
        }
        
    }
}

struct ButtonsProflie: View {
    var body: some View {
        HStack(spacing: 3){
            Button{
                print("Click Edit")
            }label: {
                Text("Edit Profile")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .frame(width: 160,height: 40)
            .background(Color.primary)
            .cornerRadius(10)
            
            Button{
                print("Click share")
            }label: {
                Text("Share profile")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .frame(width: 160,height: 40)
            .background(Color.primary)
            .cornerRadius(10)
            
            Button{
                print("Click share")
            }label: {
                Image(systemName: "person.fill.badge.plus")
                    .renderingMode(.original)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 20,height: 20)
                    .background(Color.primary)
            }
            .frame(width: 40,height: 40)
            .background(Color.primary)
            .cornerRadius(10)
            
        }
    }
}
