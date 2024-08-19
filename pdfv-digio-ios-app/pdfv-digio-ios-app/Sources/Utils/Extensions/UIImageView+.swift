//
//  UIImageView+.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 19/08/24.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        UIImage.load(from: url) { [weak self] image in
            self?.image = image
            self?.determineSelfHeight()
        }
    }

    func determineSelfHeight() {
        guard let image = self.image else { return }

        superview?.layoutIfNeeded()

        let aspectRatio = image.size.width / image.size.height
        let idealHeight = frame.width / aspectRatio

        if idealHeight <= image.size.width {
            height(idealHeight)
        }
    }
}
