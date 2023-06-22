//
//  ApiModle.swift
//  GitHubUserInfo
//
//  Created by Mukund vaghasiya  on 18/06/23.
//
//

import Foundation


enum apiError:Error{
    case invalidUrl
    case invalidData
    case invalidResponse
}

struct ApiModle:Codable{
    var login:String?
    var avatar_url:String?
    var bio:String?
    var followers:Int?
    var following:Int?
}

struct Followers:Codable,Hashable{
    var id:Int?
    var login:String?
    var avatar_url:String?
}

class ApiParseFunc{
    
    func URLRequest(endpoint:String?) async throws -> Data{
        let url = URL(string: endpoint!)
        guard let url = url else{ throw apiError.invalidUrl }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse ,response.statusCode == 200 else{throw apiError.invalidResponse}
        return data
    }
    
    
    
}
