//
//  APIResponse.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Foundation

/**
 * Generic response model
 * Expected by Repositories, no matter the status code of the server response
 */
struct APIResponse<DataModel> {

    let success: Bool
    let error: APIError?
    let data: DataModel?

    static func success<DataModel>(_ data: DataModel?) -> APIResponse<DataModel> {
        return APIResponse<DataModel>(success: true, error: nil, data: data)
    }

    static func failure(_ error: APIError?, _ data: DataModel? = nil) -> APIResponse<DataModel> {
        return APIResponse<DataModel>(success: false, error: error, data: data)
    }

}
