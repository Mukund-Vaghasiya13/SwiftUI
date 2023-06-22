//
//  ProfileView.swift
//  GitHubUserInfo
//
//  Created by Mukund vaghasiya  on 21/06/23.
//

import SwiftUI

struct ProfileView: View {
    @Binding var Path:NavigationPath
    var ImageUrl:String?
    var Follower:Int?
    var Following:Int?
    var Followerendpoint:String?
    var Followingendpoint:String?
    @Binding var id:Bool
    @State var apidata:[Followers] = []
    var body: some View {
            HStack(spacing: 40) {
                VStack(spacing: 10) {
                    AsyncImage(url: URL(string: ImageUrl ?? "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg")) { Image in
                        Image
                            .resizable()
                            .frame(width:100,height: 100)
                            .background(Color.gray)
                        
                            
                    } placeholder: {
                        ProgressView()
                            .foregroundColor(Color.white)
                            .frame(width:100,height: 100)
                            .background(Color.gray)
                          
                    }.clipShape(Circle())
                        .shadow(radius: 10)
                    
                        
                }
                
                Button {
                    Task{
                        let data = try await ApiParseFunc().URLRequest(endpoint: Followerendpoint)
                        do{
                            apidata = try JSONDecoder().decode([Followers].self, from: data)
                            print(apidata)
                            id = false
                            Path.append(apidata)
                        }catch{
                            throw apiError.invalidData
                        }
                    }
                   
                } label: {
                    ButtonLable(title: "Followers",NumberOfpeople: Follower)
                }

                
                Button {
                    Task{
                        let data = try await ApiParseFunc().URLRequest(endpoint: Followingendpoint)
                        do{
                            apidata = try JSONDecoder().decode([Followers].self, from: data)
                            print(apidata)
                            id = true
                            Path.append(apidata)
                        }catch{
                            throw apiError.invalidData
                        }
                    }

                    
                } label: {
                    ButtonLable(title: "Following",NumberOfpeople: Following)
                }
               
            }.padding(.top)
    }
}
