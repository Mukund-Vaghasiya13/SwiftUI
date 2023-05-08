//
//  ContentView.swift
//  GridPracticeUI
//
//  Created by Mukund vaghasiya  on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    var arr:[GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
        
    ]
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVGrid(columns: arr){
                    
                    ForEach(0..<20) { Item in
                        Rectangle()
                            .frame(height: 150)
                    }
                }
            }
            Spacer()
            List(0..<20) { Item in
                HStack{
                    Rectangle()
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
