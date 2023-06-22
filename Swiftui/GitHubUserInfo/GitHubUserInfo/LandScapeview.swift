//
//  LandScapeview.swift
//  GitHubUserInfo
//
//  Created by Mukund vaghasiya  on 21/06/23.
//

import SwiftUI

struct LandScapeview: View {
    @State var Search:String = ""
    @State var apidata:ApiModle?
    @State var Path = NavigationPath()
    @State var id = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                HStack{
                    VStack(alignment: .leading){
                        Text(apidata?.login ?? "Github User")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                        
                            .padding()
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
                        }
                        ProfileView(Path: $Path, ImageUrl: apidata?.avatar_url,Follower: apidata?.followers,Following: apidata?.following,Followerendpoint: "https://api.github.com/users/\(Search)/followers",Followingendpoint:"https://api.github.com/users/\(Search)/following", id: $id)
                            .navigationDestination(for: [Followers].self) { data in
                                FollowersData(data: data,title: id ? "Following":"Followers")
                            }
                            
                        Text(apidata?.bio ?? "")
                            .padding()
                           
                            
                        Spacer()
                    }
                    Spacer()
                    List{
                        HStack{
                            Text("ok")
                        }
                    }
                }
                
            }
        }
    }
}



struct LandScapeview_Previews: PreviewProvider {
    static var previews: some View {
        LandScapeview()
    }
}
