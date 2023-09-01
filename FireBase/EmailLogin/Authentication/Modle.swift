//
//  Modle.swift
//  FireBaseAuth
//
//  Created by Mukund vaghasiya  on 30/08/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth

enum MyErrorList:Error{
    case AuthFail
    case userNotFound
    case InvalidSinIn

}

struct UserDetails:Hashable{
    var uid:String
    var email:String
    var displayname:String
    var photoURL:String
    
    
    init(user:User?){
        uid = user?.uid ?? "nil"
        displayname = user?.displayName ?? "nil"
        photoURL = user?.photoURL?.absoluteString ?? "nil"
        email = user?.email ?? "nil"
    }
   
}


class AuthLogic{
    
    static var shared = AuthLogic()
    
    func CreatUser(email:String,pass:String)async throws -> UserDetails {
        var result:AuthDataResult?
        do{
            result = try await Auth.auth().createUser(withEmail: email, password: pass)
            
        }catch{
            print(error.localizedDescription)
        }
        guard let result = result else {throw MyErrorList.AuthFail}
        return UserDetails(user: result.user)
    }
    
    func SinInUser(email:String,Pass:String) async throws ->UserDetails?{
        do{
            let Dic = try await Auth.auth().signIn(withEmail: email, password: Pass)
            return UserDetails(user: Dic.user)
        }catch{
            throw MyErrorList.InvalidSinIn
        }
        
    }
    
    func IsUserSinIn() throws -> UserDetails{
        guard let user = Auth.auth().currentUser else{ throw MyErrorList.userNotFound }
        return UserDetails(user: user)
    }
    
    func SinOut(){
        do{
           try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }
    }
}
