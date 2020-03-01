//
//  UILabelExtension.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

extension UILabel {

    @IBInspectable var localizingKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }

}
