//
//  ContentView.swift
//  SizeClass
//
//  Created by Mukund vaghasiya  on 06/06/23.
//

import SwiftUI
struct dataModle:Identifiable,Hashable{
    var id = UUID()
    var title:String?
    var name:String?
    var des:String?
    
}

struct ContentView: View {
    @State var selected:dataModle?
    @State var arr:[dataModle] = [
    
        .init(title:"Anime",name: "One Piece",des: "\"One Piece is legendry tresure an boy name Luffy want to find it and want to became king of pirate\""),
        .init(title:"Anime",name: "Naruto",des: "\"Anime about ninja world, Story of a boy who want to be a Hokage\"")
    ]
        
    @Environment(\.verticalSizeClass) var vertical
    @Environment(\.horizontalSizeClass) var horizontal
    var body: some View {
         if vertical == .regular && horizontal == .regular{
             NavigationSplitView {
                 List(arr,id:\.id,selection: $selected){ i in
                     HStack{
                         Text(i.name!)
                         NavigationLink(i.title!, value: i)
                     }
                 }.navigationTitle("List")
             } detail: {
                 VStack{
                     Text(selected?.title ?? "nil")
                     Spacer()
                     Text(selected?.name ?? "nil")
                     Text(selected?.des ?? "nil")
                     Spacer()
                 }
                 
             }
             
        }
        else{
            NavigationStack {
                   VStack{
                    List{
                        ForEach(arr,id: \.id){ data in
                            VStack{
                                Text(data.name!)
                                Spacer()
                                Text(data.des!)
                            }
                            
                        }
                    }
               }.navigationTitle("List")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .previewDevice("iPhone 14 Plus")
        
        ContentView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            
    }
}
