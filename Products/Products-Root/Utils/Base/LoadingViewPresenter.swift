//
//  LoadingViewPresenter.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import NVActivityIndicatorView

protocol LoadingViewPresenter where Self: BaseViewController {
    func showLoadingView()
    func hideLoadingView()
}

extension LoadingViewPresenter {

    func showLoadingView() {
        LoadingView.showLoadingAnimation()
    }

    func hideLoadingView() {
        LoadingView.hideLoadingAnimation()
    }

}

private class LoadingView: UIView {

    static func showLoadingAnimation() {
        let activityIndicatorData = ActivityData(type: .ballBeat, color: UIColor.black)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityIndicatorData, nil)

    }

    static func hideLoadingAnimation() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }

}
