//
//  ContentView.swift
//  ListAPP
//
//  Created by Mukund vaghasiya  on 26/03/23.
//

import SwiftUI

struct ContentView: View {
    var arr = ["df0","df1","df2","df3","df4"]
    var title = ["Modle nika","Branch branch","Enel Electro","Flame Flame","OP OP"]
    @State private var idO = 0
    var body: some View {
        NavigationView{
            List(arr, id:\.self){ item in
                HStack{
                    NavigationLink {
                        OP(image: item)
                    } label: {
                        Image(item)
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 100,height: 100)
                        Spacer()
                        Text(verbatim: "OK")
                            .font(.system(size: 30))
                        
                        Spacer()
                    }
                }.navigationTitle("Devil Fruit")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
