//
//  ContentView.swift
//  PropertyWrapper@OOand@SO
//
//  Created by Mukund vaghasiya  on 20/05/23.
//

import SwiftUI
//MARK: Identifiable is Protocol it has member or [var] id
struct Modle:Identifiable {
    //MARK: UUID Genrate Automatic Id
    var id:Int = UUID().hashValue
    var name:String?
    var Price:String?
    
    init(name: String? = nil, Price: String? = nil) {
        self.name = name
        self.Price = Price
    }
}

//MARK: ObservableObject is Protocol that will observe the Products changes

class Products:ObservableObject{
    //MARK:  @Published its same as @State for Class it will automatically publish any changees to the property to any view that are subscreibed to the object's publicer it emit the notification
    @Published var ArrOfPorducts:[Modle]?
    
    init(){
        _ProductMethode()
    }
    
    private func _ProductMethode()
    {
        ArrOfPorducts = [
            .init(name:"iPhone",Price: "999"),
            .init(name:"Mac Book",Price: "999"),
            .init(name:"Nokia",Price: "200")
        ]
    }
    
    func deletProduct(index:IndexSet)
    {
        ArrOfPorducts?.remove(atOffsets: index)
    }
}

struct ContentView: View {
    //MARK: @StateObject is simillar to @ObservedObject
    @StateObject var object:Products  = Products()
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(object.ArrOfPorducts!) { Item in
                        HStack{
                            Text(Item.name!)
                            Spacer()
                            Text(Item.Price!)
                            
                        }
                    }
                    .onDelete { Indexset in
                        object.deletProduct(index: Indexset)
                    }
                }
                
            }
            .navigationTitle("Products")
            .toolbar {
                    NavigationLink("Click") {
                        SecondScreen(newobj: object)
                    }
            }
        }
    }
}

struct SecondScreen:View{
    // MARK:  @Published property value is change it will emit Notification and that will observe by @ObservedObject and react to changes in an Observable object
    @ObservedObject var newobj:Products
    var body: some View{
        ZStack{
            VStack{
                List{
                    ForEach(newobj.ArrOfPorducts!){ item in
                        HStack{
                            Text(item.name!)
                            Spacer()
                            Text(item.Price!)
                            
                        }
                    }.onDelete { IndexSet in
                        newobj.deletProduct(index: IndexSet)
                    }
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
