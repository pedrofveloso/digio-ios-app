//
//  AppDelegate.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupFirstScreen()
        return true
    }
}

private extension AppDelegate {
    func setupFirstScreen() {
        let firstScreen = HomeViewController()
        window = .init(frame: UIScreen.main.bounds)
        window?.rootViewController = firstScreen
        window?.makeKeyAndVisible()
    }
}
