//
//  HomeProductsCell.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

protocol Banner {
    var imageView: UIImageView { get }
    func downloadImage(from url: URL)
}

extension Banner {
    func downloadImage(from url: URL) {
        UIImage.load(from: url) { image in
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
}

final class HomeProductsCell: UICollectionViewCell, Banner {
    private(set) var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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

extension HomeProductsCell: ViewCodable {
    func setupSubviews() {
        contentView.addSubview(imageView)
    }

    func setupConstraints() {
        imageView.edges(to: contentView, constant: 24)
    }

    func setupCompletion() {
        contentView.backgroundColor = .white
        contentView.addCornerRadius(value: 16)
        addShadow(cornerRadius: 16)
    }
}
