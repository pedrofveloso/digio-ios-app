//
//  HomeViewController.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func set(state: HomeViewController.State)
}

final class HomeViewController: UIViewController {
    enum State {
        case loading
        case loaded(_ model: HomeModel)
        case error(_ message: String)
    }

    private lazy var header = HomeHeaderView()
    private lazy var spotlight = HomeCollectionView<HomeSpotlightCell>(layout: .homeSpotlight, parent: self)
    private lazy var digioCash = HomeDigioCashView()
    private lazy var products = HomeProductsView()

    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            header,
            spotlight,
            digioCash,
            products
        ])
        stack.axis = .vertical
        stack.spacing = 24
        return stack
    }()

    private let presenter = HomePresenter()

    init() {
        super.init(nibName: nil, bundle: nil)
        presenter.set(delegate: self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.fetchProducts()
    }
}

extension HomeViewController: ViewCodable {
    func setupSubviews() {
        view.addSubview(vStack)
    }

    func setupConstraints() {
        spotlight
            .height(176)

        digioCash
            .height(136)

        products
            .height(142)

        vStack
            .top(to: view.topAnchor)
            .horizontals(to: view)
            .bottom(to: view.bottomAnchor, makeLessThanOrEqual: true)
    }

    func setupCompletion() {
        view.backgroundColor = .white
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func set(state: State) {
        switch state {
        case .loading:
            present(LoadingViewController(), animated: true)

        case .loaded(let model):
            dismiss(animated: true)

            spotlight.update(banners: model.spotlight)
            digioCash.update(banner: model.digioCash)
            products.update(banners: model.products)

        case .error:
            break
            // TODO: Show error message
        }
    }
}
