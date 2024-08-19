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
        label.textColor = .primary
        return label
    }()

    private lazy var products = HomeCollectionView<HomeProductsCell>(layout: .homeProducts, action: action)

    private let action: BannerAction

    init(frame: CGRect = .zero, action: @escaping BannerAction) {
        self.action = action
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
        addSubview(title)
        addSubview(products)
    }

    func setupConstraints() {
        title
            .top(to: topAnchor)
            .leading(to: leadingAnchor, constant: 16)
            .trailing(to: trailingAnchor)

        products
            .top(to: title.bottomAnchor, constant: 16)
            .horizontals(to: self)
            .bottom(to: bottomAnchor)
    }
}
