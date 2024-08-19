//
//  HomeDigioCashView.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 17/08/24.
//

import UIKit

class HomeDigioCashView: UIView {

    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title, imageView])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    private let action: BannerAction
    private var banner: HomeModel.Banner?

    init(
        frame: CGRect = .zero,
        action: @escaping BannerAction
    ) {
        self.action = action
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(banner: HomeModel.Banner) {
        self.banner = banner

        title.text = banner.name

        setupTitleStyle()

        guard let imageURL = banner.imageURL else { return }

        imageView.loadImage(from: imageURL)
    }
}

private extension HomeDigioCashView {
    func setupTitleStyle() {
        guard let text = title.text else { return }
        let range = (text as NSString).range(of: "Cash")
        let attributedString = NSMutableAttributedString(string: text)

        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.gray, range: range)
        title.attributedText = attributedString
    }

    func addTapActionToImageView() {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(self.executeAction))
        imageView.addGestureRecognizer(tapGesture)
    }

    @objc func executeAction() {
        guard let banner else { return }
        action(banner)
    }

    func determineImageViewHeight(for image: UIImage) {
        layoutIfNeeded()
        let aspectRatio = image.size.width / image.size.height
        let idealHeight = imageView.frame.width / aspectRatio

        if idealHeight <= image.size.width {
            imageView.height(idealHeight)
        }
    }
}

extension HomeDigioCashView: ViewCodable {
    func setupSubviews() {
        addSubview(vStack)
    }

    func setupConstraints() {
        vStack
            .horizontals(to: self, constant: 16)
            .verticals(to: self)
    }

    func setupCompletion() {
        addTapActionToImageView()
    }
}
