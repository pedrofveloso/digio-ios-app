//
//  HomeSpotlightCell.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 17/08/24.
//

import UIKit

final class HomeSpotlightCell: UICollectionViewCell, Banner {
    private(set) var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()

    override func didMoveToSuperview() {
        setup()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        imageView.image = nil
    }
}

extension HomeSpotlightCell: ViewCodable {
    func setupSubviews() {
        contentView.addSubview(imageView)
    }

    func setupConstraints() {
        imageView.edges(to: contentView)
    }

    func setupCompletion() {
        contentView.addCornerRadius(value: 8)
        addShadow(cornerRadius: 8)
    }
}
