//
//  FollowerAndFollowingdata.swift
//  GitHubUserInfo
//
//  Created by Mukund vaghasiya  on 21/06/23.
//

import SwiftUI

struct FollowersData:View{
    var data:[Followers]
    var colum:[GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
    ]
    var title:String?
    var body: some View{
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack{
                ScrollView {
                    LazyVGrid(columns: colum) {
                        ForEach(data,id: \.id) { followers in
                            VStack{
                                AsyncImage(url: URL(string: followers.avatar_url ?? "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg")) { Image in
                                    Image
                                        .resizable()
                                        .frame(width:110,height: 110)
                                        .background(Color.gray)
                                    
                                        
                                } placeholder: {
                                    ProgressView()
                                        .foregroundColor(Color.white)
                                        .frame(width:100,height: 100)
                                        .background(Color.gray)
                                }.cornerRadius(10)
                                    .shadow(radius: 10)
                                
                                Text(followers.login!)
                                    .font(.system(size: 15))
                                    .bold()
                            }.frame(width:130,height: 130)
                                .padding()
                           
                        }
                       
                    }.padding()
                }
            }.navigationTitle(title!)
        }
    }
    
}
