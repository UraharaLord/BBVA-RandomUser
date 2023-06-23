//
//  Person.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

// MARK: - Result
struct Person: Codable {
    let id: ID
    let name: Name
    let login: User
    let nat: String
    let cell: String
    let dob: Birthday
    let email: String
    let phone: String
    let gender: String
    let picture: Picture
    let location: Location
    let registered: Birthday
}
