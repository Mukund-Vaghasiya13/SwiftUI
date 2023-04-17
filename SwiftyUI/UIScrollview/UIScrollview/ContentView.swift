//
//  ContentView.swift
//  UIScrollview
//
//  Created by Mukund vaghasiya  on 07/04/23.
//

import SwiftUI

struct ContentView: View {
    var arr:[Color] = [.red,.teal,.orange,.purple,.brown,.yellow]
    var body: some View {
        ZStack{
            LinearGradient(colors: [.indigo,Color.blue], startPoint: .trailing, endPoint: .leading)
                .ignoresSafeArea()
            VStack{
                ScrollView(.horizontal){
                    HStack(spacing: 0){
                        ForEach(0..<6) { item in
                            Rectangle()
                                .fill(arr[item])
                                .frame(width: 400,height:200)
                                .cornerRadius(20)
                        }
                    }
                    .frame(width:.infinity,height: 200)
                }
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(0..<6) { item in
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 200,height:300)
                                .cornerRadius(20)
                                .shadow(radius: 90)
                        }
                    }
                    
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
