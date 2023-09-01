//
//  LoginView.swift
//  FireBaseAuth
//
//  Created by Mukund vaghasiya  on 01/09/23.
//

import SwiftUI

class loginLogic:ObservableObject{
    @Published var username = ""
    @Published var password = ""
    @Published var Alert = false
    @Published var User:UserDetails?
    
    
    func Sinin() async{
        do{
            User = try await AuthLogic.shared.SinInUser(email: username, Pass: password)
        }catch(MyErrorList.InvalidSinIn){
            print("Invalid Sining")
        }catch{
            print(error.localizedDescription)
        }
    }
}

struct LoginView: View {
    @Binding var Path:NavigationPath
    @StateObject var LoginLogic = loginLogic()
    
    var body: some View {
        VStack(spacing: 20){
            TextField("Enter Email", text: $LoginLogic.username)
                .frame(width: 300,height: 55)
                .padding(.leading)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 2.5))
                    
                }
                .padding()
            
            
            SecureField("Password", text: $LoginLogic.password)
                .frame(width: 300,height: 55)
                .padding(.leading)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 2.5))
                    
                }
                .padding()
            
            Button {
                Task{
                    await LoginLogic.Sinin()
                    if let user = LoginLogic.User{
                        print(user)
                        Path.append(user)
                    }else{
                        //
                    }
                }

            } label: {
                Text("Sinup")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(width: 300,height: 55)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding()
            }
            Spacer()
        }.navigationTitle("Login")
    }
    
}
