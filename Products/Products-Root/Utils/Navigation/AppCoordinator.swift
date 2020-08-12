//
//  AppCoordinator.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    private let navigationController: UINavigationController
    private let window: UIWindow
    private var authenticationCoordinator: AuthenticationCoordinator?
    private var tabBarCoordinator: TabBarCoordinator?
    private var profileCoordinator: ProfileCoordinator?

    // MARK: - Initializer
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }

    // MARK: - Navigation
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        showAuthentication()
    }

    private func showTabBar() {
        tabBarCoordinator = TabBarCoordinator(navigationController: navigationController, delegate: self)
        tabBarCoordinator?.start()
        authenticationCoordinator = nil
    }

    private func showAuthentication() {
        authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController, delegate: self)
        authenticationCoordinator?.start()
        tabBarCoordinator = nil
    }
    
    private func showShoppingBag() {
           let repository = ShoppingBagRepositoryImpl()
           let viewModel = ShoppingBagViewModel(repository: repository)
           let viewController = ShoppingBagViewController(viewModel: viewModel, delegate: self)
       }

}

// MARK: AuthenticationCoordinatorDelegate
extension AppCoordinator: AuthenticationCoordinatorDelegate {

    func authenticationCoordinatorDidLogin() {
        showTabBar()
    }

}

// MARK: TabBarCoordinatorDelegate
extension AppCoordinator: TabBarCoordinatorDelegate {

    func profileCoordinatorDidLogout() {
        showAuthentication()
        print("AppCoordinator shows Authentication")
    }

}

// MARK: - ShoppingBagCoordinatorDelegate
extension AppCoordinator: ProductsCoordinatorDelegate {
    
    func productsCoordinatorShoppingBagWasPressed() {
        print("Shopping bag")
    }
    
    
}

extension AppCoordinator: ShoppingBagViewControllerDelagate {
    
}

