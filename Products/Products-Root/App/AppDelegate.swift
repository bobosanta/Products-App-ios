//
//  AppDelegate.swift
//  Products
//
//  Created by Dan Pop on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainNavigationController = UINavigationController()
        coordinator = AppCoordinator(navigationController: mainNavigationController, window: window!)
        coordinator?.start()
        return true
    }

}
