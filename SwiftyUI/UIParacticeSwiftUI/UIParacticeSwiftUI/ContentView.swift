//
//  ContentView.swift
//  UIParacticeSwiftUI
//
//  Created by Mukund vaghasiya  on 01/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var BoolData = false
    var body: some View {
        ZStack{
            Color.yellow
                .ignoresSafeArea()
            
            VStack{
                Button("Click") {
                    BoolData = true
                }.sheet(isPresented: $BoolData) {
                    VStack{
                        Circle()
                            .frame(width: 100)
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
