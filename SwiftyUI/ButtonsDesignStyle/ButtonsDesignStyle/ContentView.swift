//
//  ContentView.swift
//  ButtonsDesignStyle
//
//  Created by Mukund vaghasiya  on 08/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var title:String = "button example"
    var body: some View {
        VStack(spacing: 20){
            Text(title)
            
            Button("Click1") {
                title = "Button 1 Pressed"
            }.foregroundColor(.red)
            
            Button {
                title = "Button 2 Pressed"
            } label: {
                Text("Click2")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(width:200 ,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 20)
            }
            
            Button{
                title = "Button 3 Pressed"
            }label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 100)
                    .shadow(radius: 20)
                    .overlay {
                        Image(systemName: "checkmark.circle.fill")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 40,height: 40)
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
