//
//  AlertPresenter.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

protocol AlertPresenter where Self: BaseViewController {

    func showGeneralErrorAlert()
    func showError(_ error: GeneralError?)
    func showAlert(title: String, message: String)

}

extension AlertPresenter {

    func showGeneralErrorAlert() {
        let alert = UIAlertController(title: "", message: "general-error".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func showError(_ error: GeneralError? = GeneralError(title: "general-error".localized)) {
        guard let title = error?.title, let descr = error?.descr else { return }
        showAlert(title: title, message: descr)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
