//
//  APIError.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Alamofire

class APIError: GeneralError, Decodable {

    private enum CodingKeys: String, CodingKey {
        case descr = "error"
        case code = "code"
    }

    convenience init(_ error: AFError) {
        self.init(descr: error.localizedDescription)
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        descr = try values.decodeIfPresent(String.self, forKey: CodingKeys.descr)
        code = try values.decodeIfPresent(String.self, forKey: CodingKeys.code)
    }
}
