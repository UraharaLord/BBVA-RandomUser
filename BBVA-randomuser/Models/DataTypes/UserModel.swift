//
//  UserModel.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

// MARK: - Login
struct User: Codable {
    let md5: String
    let uuid: String
    let sha1: String
    let salt: String
    let sha256: String
    let username: String
    let password: String
}
