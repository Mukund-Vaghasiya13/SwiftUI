//
//  ContentView.swift
//  Color&DatePicker
//
//  Created by Mukund vaghasiya  on 10/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var Colour = Color.orange
    @State var date = Date()
    var body: some View {
        
        ZStack {
            Colour
                .ignoresSafeArea()
            VStack {
            
                ColorPicker("Colors", selection: $Colour,supportsOpacity: true)
                    .frame(width: 200,height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding()
                   
                DatePicker("Date Picker", selection: $date)
                    .datePickerStyle(.wheel)
                
                Text("\(date.formatted(date:.abbreviated, time:.omitted))")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
