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

    // MARK: - Initializer
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }

    // MARK: - Navigation
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        pushSplash()
    }

    // MARK: - Private
    private func pushSplash() {
        let repository = SplashRepositoryImpl()
        let viewModel = SplashViewModel(repository: repository)
        let viewController = SplashViewController(viewModel: viewModel, delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showLogin() {
        let repository = LoginRepositoryImpl()
        let viewModel = LoginViewModel(repository: repository)
        let viewController = LoginViewController(viewModel: viewModel, delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showRegister() {
       let repository = RegisterRepositoryImpl()
       let viewModel = RegisterViewModel(repository: repository)
       let viewController = RegisterViewController(viewModel: viewModel, delegate: self)
       navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showTabBar() {
        //TODO: implement
    }

}

// MARK: - LoginViewControllerDelegate
extension AppCoordinator: LoginViewControllerDelegate {

    func loginViewControllerDidLogin() {
        showLogin()
    }

}

// MARK: - SplashViewControllerDelegate
extension AppCoordinator: SplashViewControllerDelegate {
    
    func splashViewControlledDidPressSignIn() {
        showLogin()
    }
    
    func splashViewControllerDidPressRegister() {
        showRegister()
    }
    
}

// MARK: - RegisterViewControllerDelegate

extension AppCoordinator: RegisterViewControllerDelegate {
    
    func registerViewControllerDidPressSignIn() {
        showLogin()
    }
    
}
