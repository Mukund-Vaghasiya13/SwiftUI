//
//  ContentView.swift
//  ExtractingSubviews
//
//  Created by Mukund vaghasiya  on 09/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            
            MyRectangeView(colors: .red, text: "Hello")
            MyRectangeView(colors: .blue, text: "Hi")
            MyRectangeView(colors: .purple, text: "By")
            
            Spacer()
            
            HStack(spacing: 60){
                CircleViewExtercted(colors: .indigo, bgcolor: .orange)
                CircleViewExtercted(colors: .red, bgcolor: .yellow)
                CircleViewExtercted(colors: .pink, bgcolor: .green)
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


struct MyRectangeView: View {
    var colors:Color
    
    var text:String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colors)
            .frame(width: 100,height: 100)
            .overlay {
                Text(text)
            }
    }
}

struct CircleViewExtercted: View {
    var colors:Color
    var bgcolor:Color
    var body: some View {
        Circle()
            .fill(colors)
            .frame(width: 50)
            .background {
                Circle()
                    .fill(bgcolor)
                    .frame(width: 100,height: 100)
                    .shadow(radius: 30)
            }
    }
}
