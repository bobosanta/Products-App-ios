//
//  BaseViewController.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    private var viewModel: BaseViewModel!

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardHeightChangeObservers()
    }

}

// MARK: - Keyboard
extension BaseViewController {

    /// Method for registering observers that listen to keyboard actions (hide/show). To be used in `viewWillAppear` by subclassing `UIViewControllers`.
    /// Its counterpart, `removeKeyboardHeightChangeObservers` is automatically called on `viewWillDisappear`
    func registerKeyboardHeightChangeObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(adjustForKeyboard),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(adjustForKeyboard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }

    @objc
    func keyboardChanged(height: CGFloat) { }

    private func removeKeyboardHeightChangeObservers() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
    }

    @objc
    private func adjustForKeyboard(notification: Notification) {
        if notification.name == UIResponder.keyboardWillHideNotification {
            keyboardChanged(height: 0.0)
        } else {
            if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
                keyboardChanged(height: keyboardHeight)
            }
        }
    }
}
