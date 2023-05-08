//
//  ContentView.swift
//  Animations
//
//  Created by Mukund vaghasiya  on 09/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var boolsdata = false
    var body: some View {
        VStack{
            
        
           Image("Gear5")
                .resizable()
                .frame(width: boolsdata ? 300 : 100 ,height: boolsdata ? 300 : 100)
                .background(Color.black)
                .cornerRadius(50)
                .offset(y: boolsdata ?  200:0)
                .onTapGesture {
                   withAnimation(Animation.easeInOut){
                           boolsdata.toggle()
                    }
                }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
