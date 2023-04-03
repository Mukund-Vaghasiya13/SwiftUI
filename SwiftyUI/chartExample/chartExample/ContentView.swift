//
//  ContentView.swift
//  chartExample
//
//  Created by Mukund vaghasiya  on 31/03/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    var fruit:[Fruit] = [
                            .init(name: "mango", sell: 5000),
                            .init(name: "apple", sell: 3000),
                            .init(name: "grapes", sell: 4009),
                            .init(name: "Orange", sell: 5000)
                        ]
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.orange,.yellow,.white], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack{
                VStack(alignment: .leading){
                    Text("Fruit")
                        .font(.system(size: 50))
                        .foregroundColor(.black)
                        .bold()
                    Chart{
                        RuleMark(y: .value("Goal", 3000))
                            .lineStyle(StrokeStyle(lineWidth: 4,dash: [5]))
                        ForEach(fruit,id: \.self) { fruits in
                            BarMark(x: .value("Fruits", fruits.name), y: .value("Sell", fruits.sell))
                                .foregroundStyle(.linearGradient(colors: [.red,.pink,.purple], startPoint: .topTrailing, endPoint: .bottomLeading))
                        }
                        
                    }
                    .frame(width: 300,height: 200)
                    
                    Spacer()
                    
                    
                }
                NavigationView{
                    List{
                            ForEach(fruit,id: \.self){ item in
                                
                                HStack{
                                    Text(item.name)
                                        .bold()
                                        .font(.system(size: 20))
                                    
                                    Spacer()
                                    Text("\(item.sell)")
                                
                            }
                        }
                        
                    }
                    .navigationTitle("Sells")
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


struct Fruit:Hashable{
    var name:String
    var sell:Int
}
