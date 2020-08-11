//
//  TabBarViewController.swift
//  Products
//
//  Created by Dan Pop on 11/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol TabBarViewControllerDelegate: class {
    
}

class TabBarViewController: UITabBarController {
    
    private weak var tabBarViewControllerDelegate: TabBarViewControllerDelegate?
    
   convenience init(delegate: TabBarViewControllerDelegate) {
        self.init()
        tabBarViewControllerDelegate = delegate
        
    }
    
}
