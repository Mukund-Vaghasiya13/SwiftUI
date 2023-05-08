//
//  ContentView.swift
//  baindingStateView
//
//  Created by Mukund vaghasiya  on 09/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var bgBool:Bool = false
    @State var bgcolors:Color = .green
    var body: some View {
        ZStack {
        
            bgcolors
                .ignoresSafeArea()
            VStack {
                ButtonClickChange(BgBool: $bgBool, BgColor: $bgcolors)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonClickChange: View {
    @Binding var BgBool:Bool
    @Binding var BgColor:Color
    var body: some View {
        Button{
            BgBool.toggle()
            print(BgBool)
            checking()
        }label: {
            Text("Click")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 200,height: 40)
                .background(Color.black)
                .cornerRadius(10)
                .shadow(radius: 30)
        }
    }
    
    func checking()
    {
        if BgBool{
            BgColor = .yellow
        }
        else {
            BgColor = .green
        }
    }
}
