//
//  HomeView.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

final class HomeView: UIView {
    private lazy var header = HomeHeaderView()
    private lazy var spotlight = HomeSpotlightCollectionView()
    private lazy var digioCash = HomeDigioCashView()

    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            header,
            spotlight,
            digioCash,
        ])
        stack.axis = .vertical
        stack.spacing = 8.0
        return stack
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCodable {
    func setupSubviews() {
        addSubview(vStack)
    }

    func setupConstraints() {
        spotlight
            .height(200)

        digioCash
            .height(132)

        vStack
            .top(to: self.topAnchor)
            .horizontals(to: self)
            .bottom(to: self.bottomAnchor, makeLessThanOrEqual: true)
    }

    func setupCompletion() {
        backgroundColor = .white
    }
}
