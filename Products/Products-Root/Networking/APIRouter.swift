//
//  APIRouter.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Alamofire

enum APIRouter: APIConfiguration {

    private static let baseUrl = "https://jsonplaceholder.typicode.com/"

    case getPosts

    // MARK: - API Configuration

    var method: HTTPMethod {
        switch self {
        case .getPosts: return .get
        }
    }

    var path: String {
        switch self {
        case .getPosts: return "posts"
        }
    }

    var headers: [String: String] {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        return headers
    }

    var parameters: Parameters? {
        switch self {
        default: return nil
        }
    }

    // MARK: - URLRequest

    func asURLRequest() throws -> URLRequest {
        let url = try (APIRouter.baseUrl + path).asURL()
        var urlRequest = URLRequest(url: url)

        // Method
        urlRequest.httpMethod = method.rawValue

        // Headers
        var headers: [String: String] = urlRequest.allHTTPHeaderFields ?? [:]
        headers.merge(self.headers, uniquingKeysWith: { _, last in last })
        urlRequest.allHTTPHeaderFields = headers

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }

}
