//
//  ContentView.swift
//  steeperSlider
//
//  Created by Mukund vaghasiya  on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var a = 0
    @State var b = 0.0
    @State var color:Color = Color.blue
    var body: some View {
        ZStack {
            color
                .ignoresSafeArea()
            VStack {
                Text("Value:\(a)")
                Stepper("Stepper") {
                    a += 10
                } onDecrement: {
                    a -= 10
                }
                Spacer()
                Slider(value: $b, in: 0...100,step: 1.0) {
                    Text("")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }onEditingChanged: { _ in
                    if(b >= 50){
                        color = .brown
                    }
                    else{
                        color = .yellow
                    }
                }
                
                Text("\(b)")
                    
                Spacer()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
