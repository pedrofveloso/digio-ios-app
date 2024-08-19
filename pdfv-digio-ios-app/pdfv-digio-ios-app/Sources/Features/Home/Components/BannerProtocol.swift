//
//  BannerProtocol.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 19/08/24.
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
