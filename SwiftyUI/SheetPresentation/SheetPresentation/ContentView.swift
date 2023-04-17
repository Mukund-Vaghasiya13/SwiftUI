//
//  ContentView.swift
//  SheetPresentation
//
//  Created by Mukund vaghasiya  on 11/04/23.
//

import SwiftUI

struct ContentView: View {
   @State var boolData = false
    var body: some View {
        
        VStack{
            
           Button("Click")
            {
                boolData.toggle()
            }.sheet(isPresented: $boolData) {
                VStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 100,height: 100)
                    Button("Click")
                    {
                        boolData.toggle()
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
