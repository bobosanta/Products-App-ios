//
//  TabBarCoordinator.swift
//  Products
//
//  Created by Dan Pop on 11/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol TabBarCoordinatorDelegate: class {
    
}

class TabBarCoordinator: Coordinator {
   
    private let navigationController: UINavigationController
    private weak var delegate: TabBarCoordinatorDelegate?
    private var tabBarViewController: TabBarViewController!
    private var productsCoordinator: ProductsCoordinator!
    private var wishlistCoordinator: WishlistCoordinator!
    private var profileCoordinator: ProfileCoordinator!
    
    // MARK: - Initializer
       init(navigationController: UINavigationController, delegate: TabBarCoordinatorDelegate) {
           self.navigationController = navigationController
           self.delegate = delegate
       }
       
       // MARK: - Navigation
          func start() {
            let tabBarViewController = TabBarViewController()
            productsCoordinator = ProductsCoordinator( delegate: self)
            wishlistCoordinator = WishlistCoordinator( delegate: self)
            profileCoordinator = ProfileCoordinator( delegate: self)
            
            tabBarViewController.viewControllers = [productsCoordinator.navigationController,
                                                    wishlistCoordinator.navigationController,
                                                    profileCoordinator.navigationController]
            
            navigationController.setViewControllers([tabBarViewController], animated: false)
          }
    
}

extension TabBarCoordinator: ProductsCoordinatorDelegate {
    
}

extension TabBarCoordinator: WishlistCoordinatorDelegate {
    
}

extension TabBarCoordinator: ProfileCoordinatorDelegate {
    
}
