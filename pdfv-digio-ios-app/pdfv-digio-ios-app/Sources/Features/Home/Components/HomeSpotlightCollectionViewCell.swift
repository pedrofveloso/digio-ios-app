//
//  HomeSpotlightCollectionViewCell.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 17/08/24.
//

import UIKit

final class HomeSpotlightCollectionViewCell: UICollectionViewCell, ViewCodable {
    private var imageView: UIImageView = {
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

    func setImage(to image: UIImage) {
        imageView.image = image
    }

    func setupSubviews() {
        contentView.addSubview(imageView)
    }

    func setupConstraints() {
        imageView.edges(to: contentView)
    }

    func setupCompletion() {
        addRoundedCorners()
        addShadow()
    }

    private func addRoundedCorners() {
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }

    private func addShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.25
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.shouldRasterize = true
    }
}
