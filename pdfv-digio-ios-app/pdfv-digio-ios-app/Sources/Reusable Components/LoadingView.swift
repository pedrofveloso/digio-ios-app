//
//  LoadingView.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

final class LoadingView: UIView {

    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.color = .blue
        return spinner
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

extension LoadingView: ViewCodable {

    func setupSubviews() {
        addSubview(spinner)
    }

    func setupConstraints() {
        spinner
            .centerX(to: self.centerXAnchor)
            .centerY(to: self.centerYAnchor)
    }

    func setupCompletion() {
        backgroundColor = .white
        spinner.startAnimating()
    }
}
