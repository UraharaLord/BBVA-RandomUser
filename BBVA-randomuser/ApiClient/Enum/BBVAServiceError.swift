//
//  BBVAServiceError.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

@frozen enum BBVAServiceError: Error {
    case none
    case failStatusCode
    case faildedtoGetData
    case failedtoCreateRequest
}
