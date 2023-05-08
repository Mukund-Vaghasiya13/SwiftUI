//
//  ContentView.swift
//  alertSwiftu
//
//  Created by Mukund vaghasiya  on 01/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var BoolData = false
    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            
            VStack {
                Button("Click") {
                    BoolData = true
                }.alert(Text("Hello"), isPresented: $BoolData) {
                    Button("Hi") {
                        
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
