//
//  ContentView.swift
//  swiftyly practice
//
//  Created by Mukund vaghasiya  on 13/06/23.
//

import SwiftUI



enum APIError:Error{
    case invalidUrl
}

struct ApiData:Codable{
    var userId:Int?
    var id:Int?
    var title:String?
    var body:String?
}


struct ContentView: View {
    @State var Name  = ""
    @State var Surname = ""
    @State var Image = ""
    @State var call = false
    @State var maindata = ApiData()
    
    var body: some View {
        VStack{
            TextViewOfTextField(Name: $Name, Title: "Enter name")
            TextViewOfTextField(Name: $Surname , Title: "Enter surname")
            TextViewOfTextField(Name: $Image , Title: "Enter surname")
            Button {
                maindata.userId = Int(Name)
                maindata.title = Surname
                maindata.body = Image
                Task {
                    do{
                        try await POSTApi()
                    }
                    catch APIError.invalidUrl{
                        print("invalid URl")
                    }
                    catch{
                        print("Other problem")
                    }
                    
                }
            } label: {
                ButtonLable()
            }

        }
    }
    func POSTApi() async throws {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        guard let url = url else{ throw APIError.invalidUrl }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let datas = ["userId":"\(maindata.userId ?? 0)" ,"title":maindata.title ??  "nil","body": maindata.body ?? "nil"]
        request.httpBody = try JSONEncoder().encode(datas)
        let (data,response) = try await URLSession.shared.data(for: request)
        print(response)
        do{
            let apidata = try JSONDecoder().decode(ApiData.self, from: data)
            print(apidata)
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextViewOfTextField: View {
    @Binding var Name:String
    var Title:String
    var body: some View {
        TextField(Title, text: $Name)
            .padding(.leading)
            .frame(width: 250,height: 40)
            .background(Color("TextBGcolor"))
            .cornerRadius(10)
    }
}

struct ButtonLable:View{
    var body: some View{
        HStack{
            Image(systemName: "square.and.arrow.down.fill")
                .renderingMode(.original)
            Spacer()
            Text("Save")
                .bold()
        }
        .padding()
        .foregroundColor(Color.white)
        .frame(width: 100,height: 40)
        .background(Color.blue)
        .cornerRadius(10)
    }
}
