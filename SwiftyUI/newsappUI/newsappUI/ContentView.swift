//
//  ContentView.swift
//  newsappUI
//  
//  Created by Mukund vaghasiya  on 01/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
                
            LinearGradient(colors: [.blue,.indigo], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            VStack(spacing: 100){
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 350,height: 100)
                    .cornerRadius(20)
                    .overlay {
                        HStack(spacing: 30){
                            Image(systemName: "magicmouse.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50,height: 70)
                            Image(systemName: "airpod.gen3.left")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50,height: 70)
                            Image(systemName: "iphone")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50,height: 70)
                            Image(systemName: "macpro.gen2.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50,height: 70)
                        }
                    }
                
                Rectangle()
                    .fill(Color.teal)
                    .frame(width: 200,height: 200)
                    .overlay(content: {
                        Circle()
                            .fill(Color.white)
                            .overlay(content: {
                                Image(systemName: "apple.logo")
                                    .renderingMode(.original)
                                    .font(.system(size: 30))
                                    .shadow(radius: 30)
                            })
                            .frame(width: 50,height: 50)
                            .background(
                                Circle()
                                    .fill(LinearGradient(colors: [.red,.orange,.yellow], startPoint: .leading, endPoint: .trailing))
                                    .frame(width: 100,height: 100)
                                    .overlay(alignment: .bottomLeading,content: {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 30,height: 30)
                                            .overlay {
                                                Text("10")
                                                    .foregroundColor(.white)
                                                    .fontWeight(.heavy)
                                                    .font(.system(size: 20))
                                            }
                                            .shadow(color: .black, radius: 50, y: 20)
                                    })
                                    .shadow(radius: 30)
                                
                            )
                    })
                    .cornerRadius(20)
                    .background(
                        Rectangle()
                            .frame(width: 300,height: 300)
                            .cornerRadius(40)
                    )
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
