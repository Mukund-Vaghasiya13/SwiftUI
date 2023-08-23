//
//  ContentView.swift
//  What'sAppClone
//
//  Created by Mukund vaghasiya  on 08/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private  var number = ""
    @State private  var name = ""
    @State private  var Selscted = 0
    @State private var show_alert = false
    @State private var AlertTitle = ""
    
    var body: some View {
            VStack {
                TabView(selection: $Selscted) {
                    Page1.tag(0)
                    Page2.tag(1)
                    Page3.tag(2)
                }.tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
    }
    var Page1: some View{
        VStack(spacing: 10){
            Image("Chater")
                .resizable()
                .scaledToFit()
                .frame(width: 250,height: 250)
            
            Text("Chatter")
                .font(.system(size: 30))
                .bold()
                
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .frame(width: 350)
                .padding()
            
            Spacer()
        }
    }
    var Page2: some View{
        
         VStack(spacing:30){
            VStack(alignment: .leading){
                Text("Mobile number")
                    .font(.system(size: 40))
                    .bold()
                
                TextField("Enter modile number", text:$number)
                    .padding()
                    .frame(width: 300,height: 40)
                    .border(.gray)
                    .keyboardType(.numberPad)
            }.padding()
          
            Button {
                if number.count == 10{
                    Selscted = 2
                }
                else{
                    show_alert = true
                    AlertTitle = "Enetr at least 10 number"
                }
            } label: {
                ButtonDecoration()
            }.alert("Enetr at least 10 number", isPresented: $show_alert) {
                Button("Ok") {}
            }
            
            Spacer()
         }
    }
    var Page3: some View{
        VStack(spacing:30){
           VStack(alignment: .leading){
               Text("Username")
                   .font(.system(size: 40))
                   .bold()
               
               TextField("Enter name", text: $name)
                   .padding()
                   .frame(width: 300,height: 40)
                   .border(.gray)
                   .keyboardType(.numberPad)
           }.padding()
         
           Button {
               if name.isEmpty{
                   show_alert = true
                   AlertTitle = "Enter user name"
               }
               else{
                   
               }
           } label: {
               ButtonDecoration()
           }.alert(AlertTitle, isPresented: $show_alert) {
               Button("Ok") {}
           }
           
           Spacer()
        }
    }
}

func ButtonDecoration()-> some View{
    return Text("Conform")
            .font(.system(size: 20))
            .fontWeight(.heavy)
            .foregroundColor(Color.white)
            .frame(width: 200,height: 40)
            .background(Color.green)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
