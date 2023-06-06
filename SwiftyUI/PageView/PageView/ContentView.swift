//
//  ContentView.swift
//  PageView
//
//  Created by Mukund vaghasiya  on 03/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Page(image: "cloud")
                Page(image: "a")
            }.tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct Page:View{
    var image:String
    var body: some View{
        VStack{
            Image(systemName: image)
                .resizable()
                .frame(width: 200,height: 200)
               
            Text("This is My page")
                .font(.system(size: 40))
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
