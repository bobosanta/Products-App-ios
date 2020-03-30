//
//  LoginViewController.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func loginViewControllerDidLogin()
}

class LoginViewController: BaseViewController, AlertPresenter, LoadingViewPresenter {

    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    // MARK: - Properties
    private var viewModel: LoginViewModel!
    private weak var delegate: LoginViewControllerDelegate?
    var passwordHidden = true

    // MARK: - Lifecycle
    convenience init(viewModel: LoginViewModel, delegate: LoginViewControllerDelegate) {
        self.init()
        self.viewModel = viewModel
        self.delegate = delegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()

    }

    // MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        viewModel.login()
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
    }
    
    @IBAction func showPasswordButtonPressed(_ sender: Any) {
        if (passwordHidden == true) {
            showPasswordButton.setTitle("Hide", for: .normal)
            passwordTextField.isSecureTextEntry.toggle()
            passwordHidden = false
        } else {
            showPasswordButton.setTitle("Show", for: .normal)
            passwordTextField.isSecureTextEntry.toggle()
            passwordHidden = true
        }
    }

    // MARK: - Private
    private func setupBindings() {
        viewModel.email.bidirectionalBind(to: emailTextField.reactive.text)
        viewModel.password.bidirectionalBind(to: passwordTextField.reactive.text)

        viewModel.event.observeNext { [weak self] value in
            guard let self = self, let value = value else { return }
            switch value {
            case .didLogin:
                self.delegate?.loginViewControllerDidLogin()
            }
        }.dispose(in: bag)

        viewModel.error.observeNext { [weak self] value in
            guard let self = self, let value = value else { return }
            self.showError(value)
        }.dispose(in: bag)

        viewModel.isRequestInProgress.observeNext { [weak self] value in
            guard let self = self else { return }
            value ? self.showLoadingView() : self.hideLoadingView()
        }.dispose(in: bag)
    }

}
