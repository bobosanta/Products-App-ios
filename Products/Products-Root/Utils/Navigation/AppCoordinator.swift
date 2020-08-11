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

}

extension AppCoordinator: AuthenticationCoordinatorDelegate {
    
    func authenticationCoordinatorDidLogin() {
        showTabBar()
    }
    
}

extension AppCoordinator: TabBarCoordinatorDelegate {
    
    
    
}
