//
//  LoginRequest.swift
//  Products
//
//  Created by bogdan razvan on 09/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Foundation

struct LoginRequest: Codable {

    var email: String?
    var password: String?

    private enum CodingKeys: String, CodingKey {
        case email
        case password
    }

}
