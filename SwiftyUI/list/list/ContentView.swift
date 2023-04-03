//
//  ContentView.swift
//  list
//
//  Created by Mukund vaghasiya  on 25/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: NextScreen(a: 10)) {
                    HStack{
                        Image(systemName:"plus.circle.fill")
                            .renderingMode(.original)
                            .scaledToFit()
                        Spacer()
                        
                        Text("Hello")
                            .font(.system(size: 25))
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        
                        
                    }
                }.navigationTitle("Hello")
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
