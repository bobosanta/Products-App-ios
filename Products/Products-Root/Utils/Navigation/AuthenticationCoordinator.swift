//
//  AuthenticationCoordinator.swift
//  Products
//
//  Created by Dan Pop on 11/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol AuthenticationCoordinatorDelegate: class {
    func authenticationCoordinatorDidLogin()
}

class AuthenticationCoordinator: Coordinator {

    private let navigationController: UINavigationController
    private weak var delegate: AuthenticationCoordinatorDelegate?

    // MARK: - Initializer
    init(navigationController: UINavigationController, delegate: AuthenticationCoordinatorDelegate) {
        self.navigationController = navigationController
        self.delegate = delegate
    }

    // MARK: - Navigation
    func start() {
        navigationController.setNavigationBarHidden(true, animated: false)
        pushSplash()
    }

    // MARK: - Private
    private func pushSplash() {
        let repository = SplashRepositoryImpl()
        let viewModel = SplashViewModel(repository: repository)
        let viewController = SplashViewController(viewModel: viewModel, delegate: self)
        navigationController.setViewControllers([viewController], animated: true)
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

}

// MARK: - LoginViewControllerDelegate
extension AuthenticationCoordinator: LoginViewControllerDelegate {

    func loginViewControllerDidLogin() {
        delegate?.authenticationCoordinatorDidLogin()
    }

}

// MARK: - SplashViewControllerDelegate
extension AuthenticationCoordinator: SplashViewControllerDelegate {

    func splashViewControlledDidPressSignIn() {
        showLogin()
    }

    func splashViewControllerDidPressRegister() {
        showRegister()
    }

}

// MARK: - RegisterViewControllerDelegate

extension AuthenticationCoordinator: RegisterViewControllerDelegate {

    func registerViewControllerDidPressSignIn() {
        showLogin()
    }

}
