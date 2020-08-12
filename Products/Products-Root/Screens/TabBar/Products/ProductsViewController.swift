//
//  ProductsViewController.swift
//  Products
//
//  Created by Dan Pop on 12/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol ProductsViewControllerDelegate: class {
    func shoppingBagPressed()
}

class ProductsViewController: BaseViewController {

    // MARK: Properties
    weak var delegate: ProductsViewControllerDelegate?
    private var viewModel: ProductsViewModel!

    // MARK: Lifecycle
    convenience init(viewModel: ProductsViewModel, delegate: ProductsViewControllerDelegate) {
        self.init()
        self.viewModel = viewModel
        self.delegate = delegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shopping Bag", style: .plain, target: self, action: #selector(shoppingBagButtonPressed))
    }

    @objc
    private func shoppingBagButtonPressed() {
        // TODO: - Implement show shopping bag functionality (ditch tabbar nav show shopping bag)
        delegate?.shoppingBagPressed()
    }


}
