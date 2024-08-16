//
//  HomeHeaderView.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import UIKit

final class HomeHeaderView: UIView {

    private let iconSize = 36.0

    private lazy var icon: UIImageView = {
        let image = UIImageView(image: .init(resource: .digio))
        image.clipsToBounds = true
        image.layer.cornerRadius = iconSize/2
        return image
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Olá, Maria"
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()

    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [icon, label])
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Make sure your class isn't using .xib or .storyboard files")
    }
}

extension HomeHeaderView: ViewCodable {
    func setupSubviews() {
        addSubview(hStack)
    }

    func setupConstraints() {
        icon
            .width(iconSize)
            .height(iconSize)

        hStack
            .horizontals(to: self, constant: 24)
            .verticals(to: self, safeArea: true)
    }

    func setupCompletion() {
        icon.layer.cornerRadius = iconSize/2
        icon.clipsToBounds = true
    }
}
