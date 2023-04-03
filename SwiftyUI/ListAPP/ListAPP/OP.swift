//
//  OP.swift
//  ListAPP
//
//  Created by Mukund vaghasiya  on 26/03/23.
//

import SwiftUI

struct OP: View {
    var image:String
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black], startPoint:.topTrailing , endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            ZStack{
                Color(.systemCyan)
                    .frame(width: 300,height: 400)
                    .cornerRadius(30)
                    .shadow(radius: 50)
                
                VStack(spacing: 40){
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .cornerRadius(40)
                    
                    
                    Text("Hello")
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                }
            }
        }
        
        
    }
}

struct OP_Previews: PreviewProvider {
    static var previews: some View {
        OP(image: "")
    }
}
