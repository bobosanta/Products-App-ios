//
//  APIConfirguration.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Alamofire

/**
 * Generic API Configuration protocol
 * - to be implemented by enums that define APIs
 */
protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var parameters: Parameters? { get }
}
