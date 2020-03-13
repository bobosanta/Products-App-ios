//
//  EncodableExtensions.swift
//  Products
//
//  Created by bogdan razvan on 09/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Foundation

extension Encodable {

    var params: [String: Any] {
        let encoder = JSONEncoder()
        return (try? JSONSerialization.jsonObject(with: encoder.encode(self))) as? [String: Any] ?? [:]
    }

}
