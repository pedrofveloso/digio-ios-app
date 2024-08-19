//
//  DetailViewController.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

class DetailViewController: UIViewController {

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(.xmark, for: .normal)
        return button
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return  imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            imageView,
            labelsVStack
        ])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    private lazy var labelsVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stack.axis = .vertical
        stack.spacing = 16
        stack.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    private let banner: HomeModel.Banner

    init(banner: HomeModel.Banner) {
        self.banner = banner
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension DetailViewController: ViewCodable {
    func setupSubviews() {
        view.addSubview(vStack)
    }

    func setupConstraints() {
        vStack
            .top(to: view.topAnchor)
            .horizontals(to: view)
            .bottom(to: view.bottomAnchor, makeLessThanOrEqual: true)
    }

    func setupCompletion() {
        view.backgroundColor = .white

        titleLabel.text = banner.name
        descriptionLabel.text = banner.description

        guard let url = banner.imageURL else { return }

        imageView.loadImage(from: url)
    }
}

private extension DetailViewController {
    func determineImageViewHeight(for image: UIImage) {
        view.layoutIfNeeded()
        let aspectRatio = image.size.width / image.size.height
        let idealHeight = imageView.frame.width / aspectRatio

        if idealHeight <= image.size.width {
            imageView.height(idealHeight)
        }
    }
}
