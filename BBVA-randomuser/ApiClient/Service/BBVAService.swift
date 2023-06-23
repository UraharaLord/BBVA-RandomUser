//
//  BBVAService.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

final class BBVAService {
    static let shared = BBVAService()
    typealias Callback<T> = (Result<T, Error>) -> Void

    private var tokenSesion: String = ""
    
    public func setToken(from autToken: String) {
        tokenSesion = autToken
    }

    // MARK: - Private
    private func request(from rmRequest: BBVARequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }

        /// Set Http method Selection
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethodSelection.rawValue

        /// Set Http Body if this is Available
        if rmRequest.isBodyData {
            request.httpBody = rmRequest.getBodyHttpData()
        }
        
        return request
    }

    /// Add httpHeaders in func Reque retur addHttpHeaderFields...
    private func addHttpHeaderFields(urlRequest: URLRequest) -> URLRequest {
        var request = urlRequest
        request.setValue("Content-Type", forHTTPHeaderField: "application/json")
        request.setValue("Authorization", forHTTPHeaderField: tokenSesion)
        return request
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///     - request: Request instance
    ///     - type: The type of object to return
    ///     - Completion: Callback with data or error
    public func execute<T: Codable>(_ request: BBVARequest, expecting type: T.Type, callback: @escaping Callback<T>) {
        guard let urlRequest = self.request(from: request) else {
            callback(.failure(BBVAServiceError.failedtoCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let data = data, error == nil else {
                callback(.failure(error ?? BBVAServiceError.faildedtoGetData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode  else {
                callback(.failure(error ?? BBVAServiceError.failStatusCode))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(type.self, from: data) // data -> Object
                callback(.success(json))
            } catch {
                callback(.failure(error))
            }
        }
        
        task.resume()
    }
}
