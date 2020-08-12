//
//  ProfileCoordinator.swift
//  Products
//
//  Created by Dan Pop on 11/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol ProfileCoordinatorDelegate: class {
    func profileCoordinatorDidLogout()
}

class ProfileCoordinator: Coordinator {

    var navigationController: UINavigationController!
    private weak var delegate: ProfileCoordinatorDelegate?

    // MARK: - Initializer
    init(delegate: ProfileCoordinatorDelegate) {
        self.delegate = delegate

        let viewController = UIViewController()
        viewController.view.backgroundColor = .purple
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logoutButtonPressed))
        navigationController = UINavigationController(rootViewController: viewController)
        let tabBarItem = UITabBarItem(title: "profile".localized, image: nil, selectedImage: nil)
        navigationController.tabBarItem = tabBarItem
    }

    @objc
    private func logoutButtonPressed() {
        print("ProfileCoordinator notifies TabBarCoordinator")
        delegate?.profileCoordinatorDidLogout()
    }

}
