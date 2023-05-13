//
//  ContentView.swift
//  pickerSwiftUI
//
//  Created by Mukund vaghasiya  on 09/05/23.
//

import SwiftUI



struct ContentView: View {
   
    var arr = ["mukund","Raju","Kaju","Aju","Baju"]
    @State var Selected = ""
    @State var bools = false
    var body: some View {
        VStack {
        
            Picker("Number", selection: $Selected) {
                ForEach(arr,id: \.self) { i in
                    Text("\(i)")
                        .padding()
                       
                }
                .foregroundColor(Color.red)
                .font(.system(size: 20))
               
            }
            .pickerStyle(.wheel)
            .frame(width:200,height: 200)
            
            Text(Selected)
                .font(.system(size: 40))
            
            Spacer()
            
            Button("Click") {
                
                bools = true
                
            }.alert("Hello", isPresented: $bools) {
                Button {
                    
                } label: {
                    Text("Ok")
                        
                }
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
