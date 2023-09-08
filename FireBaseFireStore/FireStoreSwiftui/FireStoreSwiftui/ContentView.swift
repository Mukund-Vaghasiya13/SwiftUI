//
//  ContentView.swift
//  FireStoreSwiftui
//
//  Created by Mukund vaghasiya  on 07/09/23.
//

import SwiftUI


struct MyData{
    var id:String?
    var name:String
    var message:String
    
    init(name: String, message: String) {
        self.name = name
        self.message = message
        
    }
    
    init(name: String, message: String,id:String) {
        self.name = name
        self.message = message
        self.id = id
    }
    
   
}

struct ContentView: View {
    
    @State var name = ""
    
    @State var upname = ""
    
    @State var message = ""
    @State var user = Array<MyData>()
    @State var ShowAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Etnter name", text: $name)
                .frame(width: 300,height: 55)
                .padding(.leading)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1.5))
                }
            
            TextField("Etnter Message", text: $message)
                .frame(width: 300,height: 55)
                .padding(.leading)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1.5))
                }
            
            Button {
                DataModle.Shared.InsertData(user: MyData(name: name, message: message))
            } label: {
                Text("Add")
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(width: 300,height: 55)
                    .background(Color.black)
                    .cornerRadius(5)
            }

            List{
                ForEach(user,id: \.name) { i in
                    VStack(alignment: .leading, spacing: 10){
                        Text(i.name)
                        Text(i.message)
                        Button("Update"){
                            ShowAlert = true
                        }
                        .tint(Color.green)
                        .alert("Update", isPresented: $ShowAlert) {
                            TextField("name", text: $upname)
                            Button("Ok"){
                                DataModle.Shared.UpdateData(id: i.id!, name: upname)
                            }
                        }
                    }
                    .swipeActions {
                        Button("Delet"){
                            DataModle.Shared.DeletData(id: i.id!)
                            Task{
                                user = await DataModle.Shared.fetchData()
                            }
                        }
                    }
                }
            }
            .refreshable {
                Task{
                    user = await DataModle.Shared.fetchData()
                    print(user)
                }
            }
                
        
            Spacer()
        }
        .task {
         user = await DataModle.Shared.fetchData()
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
