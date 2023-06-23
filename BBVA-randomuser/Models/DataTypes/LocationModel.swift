//
//  LocationModel.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

// MARK: - Location
struct Location: Codable {
    let city: String
    let state: String
    let postcode: Int
    let street: Street
    let country: String
    let timezone: Timezone
    let coordinates: Coordinates
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude: String
    let longitude: String
}


// MARK: - Timezone
struct Timezone: Codable {
    let offset: String
    let description: String
}
