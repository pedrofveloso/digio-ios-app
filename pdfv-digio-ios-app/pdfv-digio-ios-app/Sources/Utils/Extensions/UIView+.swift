//
//  UIView+.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

extension UIView {
    func addShadow(cornerRadius: CGFloat) {
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.25
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shouldRasterize = true
    }

    func addCornerRadius(value cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
