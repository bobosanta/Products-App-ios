//
//  ProductsCoordinator.swift
//  Products
//
//  Created by Dan Pop on 11/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol ProductsCoordinatorDelegate: class {

}

class ProductsCoordinator: Coordinator {

    var navigationController: UINavigationController!
    private weak var delegate: ProductsCoordinatorDelegate?

    // MARK: - Initializer
    init(delegate: ProductsCoordinatorDelegate) {
        self.delegate = delegate

        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shopping Bag", style: .plain, target: self, action: #selector(shoppingBagButtonPressed))
        navigationController = UINavigationController(rootViewController: viewController)

        let tabBarItem = UITabBarItem(title: "products".localized, image: nil, selectedImage: nil)
        navigationController.tabBarItem = tabBarItem

    }

    @objc
    private func shoppingBagButtonPressed() {
        // TODO: - Implement show shopping bag functionality (ditch tabbar nav show shopping bag)
        print("ProfileCoordinator notifies TabBarCoordinator")

    }

}
