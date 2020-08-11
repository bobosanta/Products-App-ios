//
//  WishlistCoordinator.swift
//  Products
//
//  Created by Dan Pop on 11/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol WishlistCoordinatorDelegate: class {
    
}

class WishlistCoordinator: Coordinator {
    
    var navigationController: UINavigationController!
    private weak var delegate: WishlistCoordinatorDelegate?
    
    // MARK: - Initializer
    init( delegate: WishlistCoordinatorDelegate) {
        self.delegate = delegate
         let viewController = UIViewController()
         viewController.view.backgroundColor = .green
         navigationController = UINavigationController(rootViewController: viewController)
        let tabBarItem = UITabBarItem(title: "wishlist".localized,image: nil, selectedImage: nil)
               navigationController.tabBarItem = tabBarItem
    }
    
}
