//
//  ContentView.swift
//  uiPracticeUI
//
//  Created by Mukund vaghasiya  on 13/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
           Text("India")
                .font(.system(size: 40))
            ScrollView(.horizontal,showsIndicators: false){
                LazyHStack{
                    ForEach(0..<10) { Index in
                        Rectangle()
                            .fill(.white)
                            .frame(width: 300,height: 200)
                            .cornerRadius(20)
                            .shadow(radius: 30)
                    }
                }.frame(width:.infinity,height: 400)
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
