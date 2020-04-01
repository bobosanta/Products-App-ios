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
    
    // MARK: IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: RegisterViewControllerDelegate?
    private var viewModel: RegisterViewModel!
    var isPasswordHidden = true
    
    // MARK: Lifecycle
    convenience init(viewModel: RegisterViewModel, delegate: RegisterViewControllerDelegate) {
        self.init()
        self.delegate = delegate
        self.viewModel = viewModel
    }
    
    // MARK: IBActions
    @IBAction func registerButtonTapped(_ sender: Any) {
    }
    
    @IBAction func showPasswordButtonTapped(_ sender: Any) {
        if isPasswordHidden {
            passwordTextField.isSecureTextEntry.toggle()
            showPasswordButton.setTitle("hide".localized, for: .normal)
            isPasswordHidden = false
        } else {
            passwordTextField.isSecureTextEntry.toggle()
            showPasswordButton.setTitle("show".localized, for: .normal)
            isPasswordHidden = true
        }
    }
    
    @IBAction func addProfileImageButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signinButtonTapped(_ sender: Any) {
    }

}
