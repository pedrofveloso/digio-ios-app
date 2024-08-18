//
//  HomeViewController.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var header = HomeHeaderView()
    private lazy var spotlight = HomeSpotlightCollectionView()
    private lazy var digioCash = HomeDigioCashView()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello world!"
        return label
    }()

    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            header,
            spotlight,
            digioCash,
            label
        ])
        stack.axis = .vertical
        stack.spacing = 8.0
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

extension HomeViewController: ViewCodable {
    func setupSubviews() {
        view.addSubview(vStack)
    }

    func setupConstraints() {
        spotlight
            .height(200)

        digioCash
            .height(132)

        vStack
            .edges(to: view)
    }

    func setupCompletion() {
        view.backgroundColor = .white
    }
}
