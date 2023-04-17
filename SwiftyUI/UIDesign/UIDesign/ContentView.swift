//
//  ContentView.swift
//  UIDesign
//
//  Created by Mukund vaghasiya  on 04/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var onClick = false
    var body: some View {
        VStack{
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange)
                .frame(width: 350,height: 50)
                
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<20) { index in
                        Rectangle()
                            .fill(.white)
                            .frame(width: 200,height: 200)
                            .cornerRadius(20)
                            .shadow(radius: 20)
                    }
                }
                .frame(width: .infinity,height: 250)
                
            }
            
            ScrollView{
                VStack{
                    ForEach(0..<20) { index in
                        Rectangle()
                            .fill(.white)
                            .frame(width: 400,height: 300)
                            .shadow(radius: 30)
                        
                    }
                }
                .frame(width: 4000,height: .infinity)
                
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

