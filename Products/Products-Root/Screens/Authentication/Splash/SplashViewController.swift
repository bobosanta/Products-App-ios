//
//  SplashViewController.swift
//  Products
//
//  Created by Dan Pop on 10/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol SplashViewControllerDelegate: class {
    func splashViewControlledDidPressSignIn()
    func splashViewControllerDidPressRegister()
}


class SplashViewController: BaseViewController {
    private var viewModel: SplashViewModel!
    weak var delegate: SplashViewControllerDelegate?
    
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        delegate?.splashViewControllerDidPressRegister()
    }
    
    @IBAction func signinButtonPressed(_ sender: Any) {
        delegate?.splashViewControlledDidPressSignIn()
    }
    
    convenience init(viewModel:SplashViewModel, delegate: SplashViewControllerDelegate) {
        self.init()
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
}

