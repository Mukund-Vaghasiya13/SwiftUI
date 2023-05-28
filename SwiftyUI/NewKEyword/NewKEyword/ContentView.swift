//
//  ContentView.swift
//  NewKEyword
//
//  Created by Mukund vaghasiya  on 28/05/23.
//

import SwiftUI

class myModle:ObservableObject{
    @Published var arr:[String] = ["apple","orange","banana","mango"]
    
    func deletData(index:IndexSet)
    {
        arr.remove(atOffsets: index)
    }
    
}

struct ContentView: View {
    @StateObject var data = myModle()
    var body: some View {
        NavigationStack {
            VStack{
                    List{
                        ForEach(data.arr, id:\.self) { item in
                            HStack {
                                Text(item)
                                Spacer()
                                NavigationLink("") {
                                    NextScreen()
                                }
                            }
                        }.onDelete { indexset in
                            data.deletData(index: indexset)
                        }
                    }
            }
        }.environmentObject(data)
        
    }
}

struct NextScreen:View{
    @EnvironmentObject var data:myModle
    var body: some View{
        VStack{
            List{
                ForEach(data.arr, id:\.self) { item in
                    HStack {
                        Text(item)
                        Spacer()
                        NavigationLink("") {
                            
                        }
                    }
                }.onDelete { indexset in
                    data.deletData(index: indexset)
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
