//
//  LoadingViewController.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

final class LoadingViewController: UIViewController {

    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.backgroundColor = .white
        return spinner
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingViewController: ViewCodable {

    func setupSubviews() {
        view.addSubview(spinner)
    }

    func setupConstraints() {
        spinner
            .centerX(to: view.centerXAnchor)
            .centerY(to: view.centerYAnchor)
            .width(50)
            .height(50)
    }

    func setupCompletion() {
        view.backgroundColor = .black.withAlphaComponent(0.15)
        spinner.layer.cornerRadius = 25
        spinner.layer.masksToBounds = true
        spinner.startAnimating()
    }
}
