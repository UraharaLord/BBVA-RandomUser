//
//  BBVAPersonsResponse.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

struct BBVAPersonsResponse: Codable {
    
    struct Info: Codable {
        let seed: String
        let version: String
        let results, page: Int
    }
    
    let info: Info
    var results: [Person]
}
