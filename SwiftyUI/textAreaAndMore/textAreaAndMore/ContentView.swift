//
//  ContentView.swift
//  textAreaAndMore
//
//  Created by Mukund vaghasiya  on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var textfild = ""
    @State var Pass = ""
    @State var TextArea = ""
    @State var On = false
    @State var On2 = false
    var body: some View {
        ZStack {
            Color("Mycolor")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Text("Form")
                        .font(.system(size:50))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("TextColor"))
                        .padding()
                    Spacer()
                }
                Spacer()
                List{
                    Section{
                        TextField("Enter name", text: $textfild)
                        SecureField("Password", text: $Pass)
                    }
                    Section{
                        Text("Enter Address:")
                        TextEditor(text: $TextArea)
                            .frame(height: 100)
                    }
                    
                    Section{
                        Toggle("Noting Just prctice", isOn: $On)
                        Toggle("Noting Just prctice2", isOn: $On2)
                    }
                    
                    Section{
                        Button("Button") {
                           print("Hello")
                        }
                    }
                        
                
                }
                .frame(width: 400,height: 600)
                .shadow(radius: 20)
                .padding(.top)
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
