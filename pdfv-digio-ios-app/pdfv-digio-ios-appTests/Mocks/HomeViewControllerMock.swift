//
//  HomeViewControllerMock.swift
//  pdfv-digio-ios-appTests
//
//  Created by Pedro Veloso on 19/08/24.
//

import Foundation
@testable import pdfv_digio_ios_app

final class HomeViewControllerMock: HomeViewControllerDelegate {
    var didSetDelegate = false
    var stateToBeSet: HomeViewController.State?

    var expectationCompletion: () -> Void = {}

    func set(state: HomeViewController.State) {
        didSetDelegate = true
        stateToBeSet = state

        expectationCompletion()
    }
}
