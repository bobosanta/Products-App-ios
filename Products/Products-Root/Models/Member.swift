//
//  Member.swift
//  Products
//
//  Created by bogdan razvan on 09/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Foundation

struct Member: Decodable {

    var address: String?
    var birthDateString: String?
    var email: String?
    var fullName: String?
    var phone: String?
    var username: String?

    private enum CodingKeys: String, CodingKey {
        case address
        case birthDateString = "birth_date"
        case email
        case fullName = "fullname"
        case phone
        case username
    }

}
