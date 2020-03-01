//
//  Post.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Foundation

struct Post: Codable {

    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?

    private enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }

}
