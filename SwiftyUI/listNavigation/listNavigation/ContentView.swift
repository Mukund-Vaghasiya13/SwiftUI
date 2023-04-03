//
//  ContentView.swift
//  listNavigation
//
//  Created by Mukund vaghasiya  on 27/03/23.
//

import SwiftUI

struct game : Hashable{
    var name:String
}

struct Platform:Hashable{
    var Pname:String
}
struct ContentView: View {
    
    var arr:[game] = [
        .init(name: "Gta"),
        .init(name: "Fifa"),
        .init(name: "Pubg")
        
    ]
    var platform:[Platform] = [
        .init(Pname: "ps5"),
        .init(Pname: "Xbox"),
        .init(Pname: "Moblie")
    ]
    
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            List{
                ForEach(arr,id: \.self) { Game in
                    NavigationLink(value:Game) {
                        Text(Game.name)
                    }
                }
                Button("Click"){
                    path.append(platform[.random(in: 0...2)])
                }
                
            }.navigationDestination(for: game.self) { game in
                ZStack{
                    LinearGradient(colors: [.blue,.indigo], startPoint: .bottomLeading, endPoint: .topTrailing)
                        .ignoresSafeArea()
                    VStack{
                        Text(game.name)
                    }
                }
            }
            .navigationDestination(for: Platform.self) { platform in
                
               Button("New"){
                   path.append(arr[.random(in: 0...2)])
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
        
   
