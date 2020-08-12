//
//  ShoppingBagViewController.swift
//  Products
//
//  Created by Dan Pop on 12/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol ShoppingBagViewControllerDelagate: class {
    
}

class ShoppingBagViewController: BaseViewController {
    
    // MARK: Properties
    weak var delegate: ShoppingBagViewControllerDelagate?
    private var viewModel: ShoppingBagViewModel!
    
    // MARK: Lifecycle
    convenience init(viewModel: ShoppingBagViewModel, delegate: ShoppingBagViewControllerDelagate) {
        self.init()
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
