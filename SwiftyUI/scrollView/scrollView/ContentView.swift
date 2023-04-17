//
//  ContentView.swift
//  scrollView
//
//  Created by Mukund vaghasiya  on 04/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVStack{
                
                ForEach(1..<100) { index in
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack{
                            ForEach(1..<20){ index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(width: 250,height: 200)
                                    .shadow(radius: 30)
                            }
                            .frame(width: .infinity,height: 250)
                        }
                    }
                }
            }
            .frame(width: 400,height: .infinity)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
