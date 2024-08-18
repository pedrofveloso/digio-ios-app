//
//  HomeViewController.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didFetchProducts()
}

final class HomeViewController: UIViewController {
    private let presenter = HomePresenter()

    init() {
        super.init(nibName: nil, bundle: nil)
        presenter.set(delegate: self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = LoadingView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.fetchProducts()
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func didFetchProducts() {
        UIView.transition(
            from: self.view,
            to: HomeView(frame: self.view.frame),
            duration: 0.5,
            options: [.transitionCrossDissolve]
        )

        print(presenter.model)
    }
}
