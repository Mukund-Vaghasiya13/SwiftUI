//
//  ContentView.swift
//  GitHubUserInfo
//
//  Created by Mukund vaghasiya  on 18/06/23.


import SwiftUI

struct ContentView: View {
    @State var Search:String = ""
    @State var apidata:ApiModle?
    @State var Path = NavigationPath()
    @State var id = false
    var body: some View {
        NavigationStack(path:$Path) {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack(spacing:20){
                    HStack(spacing:25){
                        TextField("Enter Username",text: $Search)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .frame(width: 250,height: 40)
                            .background(Color.secondary)
                            .cornerRadius(10)
                        
                        Button {
                            Task{
                                let data = try await ApiParseFunc().URLRequest(endpoint: "https://api.github.com/users/\(Search)")
                                do{
                                    apidata = try JSONDecoder().decode(ApiModle.self, from: data)
                                }
                                catch{
                                    throw apiError.invalidData
                                }
                            }
                        } label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .renderingMode(.original)
                                .resizable()
                                .foregroundColor(Color.secondary)
                                .frame(width: 40,height: 40)
                                .padding(.trailing)
                        }
                    }.padding(.top)
            
                    ProfileView(Path: $Path, ImageUrl: apidata?.avatar_url,Follower: apidata?.followers,Following: apidata?.following,Followerendpoint: "https://api.github.com/users/\(Search)/followers",Followingendpoint:"https://api.github.com/users/\(Search)/following", id: $id)
                        .navigationDestination(for: [Followers].self) { data in
                            FollowersData(data: data,title: id ? "Following":"Followers")
                        }
                        
                    Text(apidata?.bio ?? "")
                        .padding()
                       
                        
                    Spacer()
                }.navigationTitle(apidata?.login ?? "Github User")
            }
            
        }
    }
}

struct ButtonLable:View{
    var title:String?
    var NumberOfpeople:Int?
    var body: some View{
        VStack(spacing:5){
            Text("\(NumberOfpeople ?? 0)")
                .font(.system(size: 26))
                .foregroundColor(Color("Githubbg"))
                .fontWeight(.heavy)
            
            Text(title ?? "null")
                .font(.system(size: 17))
                .foregroundColor(Color("Githubbg"))
                .fontWeight(.bold)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}




