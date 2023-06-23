//
//  BBVARequest.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

final class BBVARequest {
    private enum Constants {
        static let baseURL = "https://randomuser.me/api"
    }

    internal enum HttpMethod: String {
        case none = ""
        case get = "GET"
        case post = "POST"
    }

    /// Setup desired endpoint
    private let endPoint: BBVAEndPoint

    /// Path componentes for Api
    private let pathComponents: [String]

    /// Query arguments for Api
    private let queryParameters: [URLQueryItem]

    /// Constructed url for the  api request in String, we need to do the same for send data in the body or header
    private var urlString: String {
        var string = Constants.baseURL
        
        if endPoint != .none {
            string += "/"
            string += endPoint.rawValue
        }

        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }

        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            string += argumentString
        }

        return string
    }
    
    private var bodyData: [String: Any] = [:]
    
    public var isBodyData: Bool = false
    /// Constructed Url
    public var url: URL? {
        return URL(string: urlString)
    }

    /// Http method
    public func getBodyHttpData() -> Data {
        if !bodyData.isEmpty {
            do {
                if let jsonData = try? JSONSerialization.data(withJSONObject: bodyData, options: []) {
                    return jsonData
                }
            }
        }

        return Data()
    }

    public var httpMethodSelection: HttpMethod = .none

    /// Construct Request
    ///  - Parameters:
    ///     - endPoint: Tarjet end point
    ///     - pathComponents: Collection of path components
    ///     - queryParameters: Collection of query parameters
    init(endPoint: BBVAEndPoint, pathComponents: [String] = [],
         queryParameters: [URLQueryItem] = [],
         httpMethodSelection: HttpMethod = .get,
         bodyData: [String: Any] = [:])
    {
        self.endPoint = endPoint
        self.bodyData = bodyData
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
        self.httpMethodSelection = httpMethodSelection
        self.isBodyData = self.bodyData.isEmpty ? false : true
    }
}

extension BBVARequest {
    /// Type  of endPoint
    static let listOfPersonsReq = BBVARequest(endPoint: .persons)
}
