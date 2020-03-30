//
//  RegisterViewController.swift
//  Products
//
//  Created by Dan Pop on 13/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol RegisterViewControllerDelegate: class {
    
}

class RegisterViewController: BaseViewController {
    
    // MARK: - Properties
    weak var delegate: RegisterViewControllerDelegate?
    private var viewModel: RegisterViewModel!
    
    // MARK: Lifecycle
    convenience init(viewModel: RegisterViewModel, delegate: RegisterViewControllerDelegate) {
        self.init()
        self.delegate = delegate
        self.viewModel = viewModel
    }
    
    // MARK: IBActions
    @IBAction func buttonInRegisterPressed(_ sender: Any) {
    
    }
    
}
