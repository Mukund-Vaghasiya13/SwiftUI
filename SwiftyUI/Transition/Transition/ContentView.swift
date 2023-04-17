//
//  ContentView.swift
//  Transition
//
//  Created by Mukund vaghasiya  on 10/04/23.
//

import SwiftUI

struct ContentView: View {
   @State var BoolData = false
    var body: some View {
        ZStack{
            
            VStack{
                Button("Button"){
                    withAnimation(.easeIn){
                        BoolData.toggle()
                    }
                }
                
                Spacer()
            }
            
            if BoolData {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 400)
                    
            }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
