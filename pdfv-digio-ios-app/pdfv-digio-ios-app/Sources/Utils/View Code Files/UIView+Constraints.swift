//
//  UIView+Constraints.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import UIKit

// MARK: - Constraints
extension UIView {
    // MARK: - Size
    @discardableResult
    func height(_ constant: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        heightAnchor.constraint(equalToConstant: constant).isActive = true

        return self
    }

    @discardableResult
    func width(_ constant: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        widthAnchor.constraint(equalToConstant: constant).isActive = true

        return self
    }

    // MARK: - Position
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        centerYAnchor.constraint(equalTo: anchor).isActive = true

        return self
    }

    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        centerXAnchor.constraint(equalTo: anchor).isActive = true

        return self
    }

    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true

        return self
    }

    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0, makeLessThanOrEqual: Bool = false) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        if makeLessThanOrEqual {
            bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant).isActive = true
        } else {
            bottomAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true
        }

        return self
    }

    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true

        return self
    }

    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        trailingAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true

        return self
    }

    @discardableResult
    func verticals(to parent: UIView, constant: CGFloat = 0.0, safeArea: Bool = false) -> UIView {
        let topAnchor = topAnchor(parent, safeArea: safeArea)
        let bottomAnchor = bottomAnchor(parent, safeArea: safeArea)

        return top(to: topAnchor, constant: constant)
            .bottom(to: bottomAnchor, constant: constant)
    }

    @discardableResult
    func horizontals(to parent: UIView, constant: CGFloat = 0.0, safeArea: Bool = false) -> UIView {
        let leadingAnchor = leadingAnchor(parent, safeArea: safeArea)
        let trailingAnchor = trailingAnchor(parent, safeArea: safeArea)

        return leading(to: leadingAnchor, constant: constant)
            .trailing(to: trailingAnchor, constant: constant)
    }

    @discardableResult
    func edges(to parent: UIView, constant: CGFloat = 0.0, safeArea: Bool = false) -> UIView {
        let topAnchor = topAnchor(parent, safeArea: safeArea)
        let bottomAnchor = bottomAnchor(parent, safeArea: safeArea)
        let leadingAnchor = leadingAnchor(parent, safeArea: safeArea)
        let trailingAnchor = trailingAnchor(parent, safeArea: safeArea)

        self
            .top(to: topAnchor, constant: constant)
            .bottom(to: bottomAnchor, constant: constant)
            .leading(to: leadingAnchor, constant: constant)
            .trailing(to: trailingAnchor, constant: constant)

        return self
    }
}

private extension UIView {
    func topAnchor(_ view: UIView, safeArea: Bool) -> NSLayoutYAxisAnchor {
        safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor
    }

    func bottomAnchor(_ view: UIView, safeArea: Bool) -> NSLayoutYAxisAnchor {
        safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor
    }

    func leadingAnchor(_ view: UIView, safeArea: Bool) -> NSLayoutXAxisAnchor {
        safeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor
    }

    func trailingAnchor(_ view: UIView, safeArea: Bool) -> NSLayoutXAxisAnchor {
        safeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor
    }
}
