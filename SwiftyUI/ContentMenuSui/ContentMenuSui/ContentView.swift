//
//  ContentView.swift
//  ContentMenuSui
//
//  Created by Mukund vaghasiya  on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var BoolData = false
    @State var confom = false
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 300,height: 300)
                    .overlay {
                        VStack{
                            HStack{
                                Text("Hello")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 30))
                                    .fontWeight(.heavy)
                                
                                Spacer()
                                
                                Text("🇮🇳")
                                    
                            }
                            
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20))
                            
                            Spacer()
                        }
                        .contextMenu(menuItems: {
                            Button {
                                
                            } label: {
                                Text("Share")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Like ❤️")
                            }
                            
                            

                        })
                        .padding()
                        
                    }
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300,height: 50)
                    .shadow(radius: 10)
                    .overlay {
                        HStack{
                            Button("❤️") {
                                BoolData = true
                            }.alert("Hello", isPresented:$BoolData) {
                                
                            }
                            Spacer()
                            Button("✉️") {
                                withAnimation(.easeIn) {
                                    confom = true
                                }
//                                confom = true
                                
                            }.confirmationDialog("Hello", isPresented:$confom,titleVisibility:.visible ) {
                                
                            }
                            
                            Spacer()
                            Button("👍"){
                                
                            }

                            
                        }
                        .padding(20)
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
