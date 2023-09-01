//
//  SinupView.swift
//  FireBaseAuth
//
//  Created by Mukund vaghasiya  on 30/08/23.
//

import SwiftUI

struct SinupView: View {
    @State var Path = NavigationPath()
    var body: some View {
        NavigationStack(path: $Path){
            ZStack{
                VStack{
                    
                    NavigationLink {
                        SinupUser(Path: $Path)
                    } label: {
                        Text("Creat New User")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                    NavigationLink {
                       LoginView(Path: $Path)
                    } label: {
                        Text("Log in")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                    Spacer()
                }.navigationDestination(for: UserDetails.self) { User in
                    ContentView(Path: $Path)
                }
            }
            .onAppear{
                UserISLogin()
            }
            
            .navigationTitle("Auth")
            
        }
    }
    func UserISLogin(){
        do{
            let user = try AuthLogic.shared.IsUserSinIn()
            Path.append(user)
        }catch(MyErrorList.userNotFound){
            print("Usernot Found")
        }catch{
            print("Some thing went wrong..!🥶")
        }
    }
}

struct SinupView_Previews: PreviewProvider {
    static var previews: some View {
        SinupView()
    }
}
