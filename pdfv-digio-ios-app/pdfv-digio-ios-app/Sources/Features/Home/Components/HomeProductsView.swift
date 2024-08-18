//
//  HomeProductsView.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

final class HomeProductsView: UIView {
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    private lazy var products = HomeCollectionView<HomeProductsCell>(layout: .homeProducts)

    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title, products])
        stack.axis = .vertical
        stack.spacing = 16
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

    func update(banners: [HomeModel.Banner]) {
        title.text = "Produtos"
        products.update(banners: banners)
    }
}

extension HomeProductsView: ViewCodable {
    func setupSubviews() {
        addSubview(vStack)
    }

    func setupConstraints() {
        vStack
            .horizontals(to: self, constant: 16)
            .verticals(to: self)
    }
}
