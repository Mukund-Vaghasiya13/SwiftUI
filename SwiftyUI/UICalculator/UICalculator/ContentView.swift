//
//  ContentView.swift
//  UICalculator
//
//  Created by Mukund vaghasiya  on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var ConversionFirstNo = ""
    @State var ConversionSecondtNo = ""
    @State var random:String = ""
    
    var arr:[String] = ["C","::","%","/","7","8","9","X","4","5","6","-","1","2","3","+","?","0",".","="]
    var columns:[GridItem] = [
    
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
        
        
    ]
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text(random)
                    .font(.system(size: 40))
            }
            Spacer()
            LazyVGrid(columns: columns){
                
                ForEach(0..<20) { Index in
                    Rectangle()
                        .fill(Color.primary)
                        .frame(height: 80)
                        .cornerRadius(50)
                        .overlay {
                            Text(arr[Index])
                                .font(.system(size: 30))
                                .foregroundColor(Color("MyColor"))
                        }
                        .onTapGesture {
                          
                            if arr[Index] == "C"{
                                random = ""
                            }
                            else
                            {
                                random = random + arr[Index]
                                
                                Macanisum(data: random)
                                
                            }
                            
                            
                    }
                }
            }
        }.padding()
    }
    func Macanisum(data:String)
    {
        
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
