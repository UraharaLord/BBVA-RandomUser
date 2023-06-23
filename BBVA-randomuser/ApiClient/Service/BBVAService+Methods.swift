//
//  BBVAService+Methods.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

extension BBVAService {
    
    typealias Person = BBVAPersonsResponse
    func getAllPersons(results: String = "10", idiom: BBVAIdiom = .es, page: String = "0", gender: BBVAGender = .none, callback: @escaping Callback<Person>) {
        
        
        
        if page.toInt().isGreaterThanOrEquals(1) {
            let request = BBVARequest(endPoint: .none, queryParameters: [
                URLQueryItem(name: "page", value: page),
                URLQueryItem(name: "results", value: results),
                URLQueryItem(name: "seed", value: "smartstc"),
                URLQueryItem(name: "nat", value: idiom.rawValue)
            ])
            execute(request, expecting: BBVAPersonsResponse.self, callback: callback)
            
        } else {
            
            let request = BBVARequest(endPoint: .none, queryParameters: [
                URLQueryItem(name: "results", value: results),
                URLQueryItem(name: "seed", value: "smartstc"),
                URLQueryItem(name: "nat", value: idiom.rawValue)
            ])
            execute(request, expecting: BBVAPersonsResponse.self, callback: callback)
        }
        
    }
}
