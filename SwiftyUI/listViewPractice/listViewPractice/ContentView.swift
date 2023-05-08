//
//  ContentView.swift
//  listViewPractice
//
//  Created by Mukund vaghasiya  on 29/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var arr = ["df0","df1","df2","df3","df4","df0","df1","df2","df3","df4"]
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(spacing:50){
                    Spacer()
                    List{
                        Section(header:Text("Devil Fruit")
                            .foregroundColor(.black)
                            .font(.system(size: 50))
                            .bold()
                            ){
                            ForEach(arr, id:\.self){ item in
                                HStack{
                                    NavigationLink {
                                        SecondScreen(items: item)
                                    } label: {
                                        Image(item)
                                            .resizable()
                                            .frame(width: 100,height: 100)
                                            .cornerRadius(50)
                                        
                                        Text(item.capitalized)
                                            .font(.system(size: 40))
                                            .bold()
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                arr.remove(atOffsets: indexSet)
                            }
                            
                            
                            
                        }
                    }
                    .listStyle(.insetGrouped)
                    .ignoresSafeArea()
                }
                
            }
            
        }
    }
}
struct SecondScreen: View{
    var items:String
    var body: some View {
        
        VStack{
            
            Image(items)
                .resizable()
                .frame(width: 300,height: 300)
                .cornerRadius(30)
                .padding()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
