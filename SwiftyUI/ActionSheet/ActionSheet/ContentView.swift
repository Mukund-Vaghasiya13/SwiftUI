//
//  ContentView.swift
//  ActionSheet
//
//  Created by Mukund vaghasiya  on 02/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var boolsdata = false
    @State var NavBool = false
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.indigo
                    .ignoresSafeArea()
                VStack {
                    HStack{
                        Circle()
                            .frame(width: 40)
                        Text("@mukund._.13")
                            .foregroundColor(Color.white)
                        Spacer()
                        Button {
                            boolsdata = true
                        } label: {
                            Text("🔥")
                        }
                        
                        
                    }.confirmationDialog("hello", isPresented: $boolsdata,titleVisibility: .visible) {
                        Button("Delet") {
                            
                        }
                        
                        Button("OK") {
                            NavBool = true
                        }
                    } message: {
                        Text("hi there how are you this is nothing testing text because i dont have network to google it lorem text.....")
                    }
                    
                    Rectangle()
                        .frame(height: 300)
                    HStack{
                        Text("❤️")
                        Text("✉️")
                        Spacer()
                        Text("⚙️")
                    }

                }
                .padding()
            }
            .navigationTitle(Text("Action Sheet"))
            .navigationDestination(isPresented: $NavBool) {
                   Rectangle()
                    .frame(width: 300,height: 300)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
