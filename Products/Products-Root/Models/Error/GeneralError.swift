//
//  GeneralError.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Foundation

class GeneralError: Error {

    var title: String?
    var descr: String?
    var code: String?

    init(title: String? = nil, descr: String? = "general-error".localized, code: String? = nil) {
        self.title = title
        self.descr = descr
        self.code = code
    }

}
