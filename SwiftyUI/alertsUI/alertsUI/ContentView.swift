//
//  ContentView.swift
//  alertsUI
//
//  Created by Mukund vaghasiya  on 29/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var BindBool = false
    var body: some View {
        ZStack{
            LinearGradient(colors: [.cyan,.blue,.indigo], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            VStack{
                Button {
                    BindBool = true
                } label: {
                    Text("Click")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 100,height: 50)
            .background(Color.black)
            .cornerRadius(10)
            .alert("OK",isPresented: $BindBool) {
                Button("Hi"){
                    
                }
                Button("OK"){
                    
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
