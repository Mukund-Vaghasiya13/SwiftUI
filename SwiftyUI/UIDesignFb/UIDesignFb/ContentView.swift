//
//  ContentView.swift
//  UIDesignFb
//
//  Created by Mukund vaghasiya  on 09/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: -160){
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 400,height: 250)
                    .shadow(radius: 70)
                HStack(alignment: .bottom,spacing: 0){
                    Circle()
                        .fill(.green)
                        .frame(width: 200,height: 200)
                        .overlay(content: {
                            Circle()
                                .fill(.white)
                                .frame(width: 190,height: 190)
                                .overlay(alignment: .bottomTrailing,content: {
                                    Image(systemName: "camera.circle.fill")
                                        .resizable()
                                        .renderingMode(.original)
                                        .frame(width: 50,height: 50)
                                        .background(Color.white)
                                        .cornerRadius(25)
                                    
                                    
                                })
                                .shadow(radius: 50)
                                .padding()
                        }).padding()
                    
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
