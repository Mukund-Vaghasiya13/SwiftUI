//
//  ContentView.swift
//  ResizebleSheet
//
//  Created by Mukund vaghasiya  on 08/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var present = false;
    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            VStack {
                Button {
                    present = true
                } label: {
                    Text("Click")
                        .foregroundColor(Color.white)
                }.sheet(isPresented: $present) {
                    ZStack{
                        Color.red
                            .ignoresSafeArea()
                        HStack(){
                            Image(systemName: "cloud.sun.rain.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 90,height: 90)
                                .background(Color.black)
                                .clipShape(Circle())
                                .shadow(radius: 20)
                        }
                    }
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.fraction(0.20),.fraction(0.50)])
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
