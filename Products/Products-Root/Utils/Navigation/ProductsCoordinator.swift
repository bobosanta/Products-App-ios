//
//  ProductsCoordinator.swift
//  Products
//
//  Created by Dan Pop on 11/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol ProductsCoordinatorDelegate: class {
    func productsCoordinatorShoppingBagWasPressed()
}

class ProductsCoordinator: Coordinator {

    var navigationController: UINavigationController!
    private weak var delegate: ProductsCoordinatorDelegate?

    // MARK: - Initializer
    init(delegate: ProductsCoordinatorDelegate) {
        self.delegate = delegate

        let repository = ProductsRepositoryImpl()
        let viewModel = ProductsViewModel(repository: repository)
        let viewController = ProductsViewController(viewModel: viewModel, delegate: self)
        
        navigationController = UINavigationController(rootViewController: viewController)

        let tabBarItem = UITabBarItem(title: "products".localized, image: nil, selectedImage: nil)
        navigationController.tabBarItem = tabBarItem

    }

}

extension ProductsCoordinator: ProductsViewControllerDelegate {
   
    func shoppingBagPressed() {
        delegate?.productsCoordinatorShoppingBagWasPressed()
    }
    
}
