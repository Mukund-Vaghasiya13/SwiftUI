//
//  Modle.swift
//  FireStoreSwiftui
//
//  Created by Mukund vaghasiya  on 07/09/23.
//

import Foundation
import FirebaseFirestore



class DataModle{
    
    static var Shared = DataModle()
    
    let db = Firestore.firestore()
    
    func InsertData(user:MyData){
        var ref: DocumentReference?
        
        ref = db.collection("Practice").addDocument(data: [
            "name":user.name,
            "message":user.message
        ]) { e in
            if let e = e{
                print(e.localizedDescription)
            }else{
                print(ref!.documentID)
            }
        }
        
    }
    
    func fetchData()async ->Array<MyData>{
        var users = [MyData]() // Create an array to store user data
        do{
            let querySnapshot =  try await db.collection("Practice").getDocuments()
            for document in querySnapshot.documents {
                let data = document.data()
                if let name = data["name"] as? String,let message = data["message"] as? String {
                    users.append(.init(name: name, message: message,id: document.documentID))
                }
            }
        }catch{
            print("MissionFail")
        }
        return users
    }
    
    func DeletData(id:String){
        db.collection("Practice").document(id).delete()
    }
    
    func UpdateData(id:String,name:String){
        db.collection("Practice").document(id).updateData(["name":name])
    }
}
    
