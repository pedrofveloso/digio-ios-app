//
//  HomeViewController.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello world!"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeViewController: ViewCodable {
    func setupSubviews() {
        view.addSubview(label)
    }

    func setupConstraints() {
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func setupCompletion() {
        view.backgroundColor = .white
    }
}
