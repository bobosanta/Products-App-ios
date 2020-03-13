//
//  RegisterViewController.swift
//  Products
//
//  Created by Dan Pop on 13/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol RegisterViewControllerDelegate: class {
    func testBtnPressed()
}

class RegisterViewController: BaseViewController {
    
    weak var delegate: RegisterViewControllerDelegate?
    private var viewModel: RegisterViewModel!
    
    convenience init(viewModel: RegisterViewModel, delegate: RegisterViewControllerDelegate) {
        self.init()
        self.delegate = delegate
        self.viewModel = viewModel
    }
    
    @IBAction func buttonInRegisterPressed(_ sender: Any) {
        delegate?.testBtnPressed()
    }
    
}
