//
//  APIClient.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Alamofire

/**
* General protocol used for API request/response management
* Implemented by Repositories that make API calls
*/
protocol APIClient {
    func performRequest<T: Decodable>(route: APIRouter, completion: @escaping (APIResponse<T>) -> Void)
}

// MARK: - Default Implementation
extension APIClient {

    /// Method performing a network request having a callback of concrete type 'Decodable'.
    /// - Parameter route: the route.
    /// - Parameter completion: completion handler.
    func performRequest<T: Decodable>(route: APIRouter, completion: @escaping (APIResponse<T>) -> Void) {
        print(route.path)
        AF.request(route)
            .responseJSON(completionHandler: { response in
                print(response)
            })
            .responseDecodable (decoder: JSONDecoder()) {(response: AFDataResponse<T>) in
                self.parseResponse(route: route, response: response, completion: completion)
        }
    }

    // MARK: - Private functions

    /// Method used for parsing a response of generic type.
    /// - Parameter route: the route of the request.
    /// - Parameter response: the response to be parsed.
    /// - Parameter completion: the completion handler containing the result of the parsint: success or failure.
    private func parseResponse<T: Decodable>(route: APIRouter, response: AFDataResponse<T>, completion: @escaping (APIResponse<T>) -> Void) {
        if let error = self.checkError(response: response) {
            completion(APIResponse.failure(error))
        } else {
            switch response.result {
            case .success(let data):
                completion(APIResponse<T>.success(data))
            case .failure(let error):
                completion(APIResponse.failure(APIError(error)))
            }
        }
    }

    private func checkError<T>(response: AFDataResponse<T>) -> APIError? {
        if let statusCode = response.response?.statusCode,
            statusCode >= 300,
            let data = response.data,
            let error = try? JSONDecoder().decode(APIError.self, from: data) {
            return error
        }
        return nil
    }

}
