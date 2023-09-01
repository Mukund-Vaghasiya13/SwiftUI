//
//  SinupUser.swift
//  FireBaseAuth
//
//  Created by Mukund vaghasiya  on 30/08/23.
//

import SwiftUI

@MainActor
class SinUpLogic:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var userData:UserDetails?
    
    func CreatUser()async -> Bool{
        do{
                userData = try await AuthLogic.shared.CreatUser(email: email, pass: password)
                print("\(userData!)🧐")
                return true
        }
        catch(MyErrorList.AuthFail){
            print("AuthFail")
        }catch{
            print("Some other error")
        }
        return false
    }
}


struct SinupUser: View {
    @Binding var Path:NavigationPath
    @StateObject var User = SinUpLogic()
    
    var body: some View {
        VStack(spacing: 20){
            TextField("Enter Email", text: $User.email)
                .frame(width: 300,height: 55)
                .padding(.leading)
                .overlay {
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 2.5))
                       
                }
                .padding()
                
            
            SecureField("Password", text: $User.password)
                .frame(width: 300,height: 55)
                .padding(.leading)
                .overlay {
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 2.5))
                       
                }
                .padding()
            
            Button {
                Task{
                    let a =  await User.CreatUser()
                    if a{
                        if let userData = User.userData{
                            Path.append(userData)
                        }else{
                            //Alert
                            print("Invalid")
                        }
                       
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
        }.navigationTitle("Sin Up")
    }
}


