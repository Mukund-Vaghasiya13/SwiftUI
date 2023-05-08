//
//  ContentView.swift
//  TextField
//
//  Created by Mukund vaghasiya  on 05/05/23.
//

import SwiftUI

struct Details{
    var Name:String
    var City:String
}

struct ContentView: View {
    @State var Value = ""
    @State var Value2 = ""
    @State var arr:[Details] = []
    
    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                ExtractedView()
                
                TextFieldView(data: $Value, title: "Name")
                TextFieldView(data: $Value2, title: "City")
                
                Button{
                    arr.append(.init(Name: Value, City: Value2))
                }label:{
                    Text("Click")
                }.frame(width: 300,height: 20)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                    .cornerRadius(10)
                
                Spacer()
                
                List() {
                    Section{
                        HStack{
                            Text("Name")
                                .font(.system(size: 30))
                                .padding()
                            Spacer()
                            Text("City")
                                .font(.system(size: 30))
                                .padding()
                        }
                    }
                    Section{
                        ForEach(arr, id:\.Name) { Item in
                            HStack{
                                Text(Item.Name)
                                    .font(.system(size: 30))
                                    .padding()
                                Spacer()
                                Text(Item.City)
                                    .font(.system(size: 30))
                                    .padding()
                            }
                        }.onDelete { indexSet in
                            arr.remove(atOffsets: indexSet)
                        }
                    }
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

struct ExtractedView: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: [.indigo,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .ignoresSafeArea()
            .frame(width: 400,height: 100)
            

            .overlay {
                VStack {
                    HStack(spacing: 80){
                        Image("df0")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .cornerRadius(25)
                            .padding(10)
                            .contextMenu {
                                Text("Login Icon")
                            }
                        
                        Text("Login Page")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
    }
}

struct TextFieldView: View {
    @Binding var data:String
    var title:String
    var body: some View {
        TextField(title, text: $data)
            .frame(width: 300,height: 20)
            .padding()
            .background(Color.white)
            .foregroundColor(Color.red)
            .cornerRadius(10)
            .shadow(radius: 2)
    }
}
