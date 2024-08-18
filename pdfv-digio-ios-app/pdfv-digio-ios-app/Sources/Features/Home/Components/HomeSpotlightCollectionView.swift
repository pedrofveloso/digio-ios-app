//
//  HomeSpotlightCollectionView.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import UIKit

final class HomeSpotlightCollectionView: UICollectionView {

    private lazy var cellId = "\(Self.self)_cell"

    init() {
        super.init(frame: .zero, collectionViewLayout: .layout)

        register(HomeSpotlightCollectionViewCell.self, forCellWithReuseIdentifier: cellId)

        dataSource = self

        showsHorizontalScrollIndicator = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeSpotlightCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HomeSpotlightCollectionViewCell else {
            return .init()
        }

        cell.setImage(to: .init(resource: .rechargeBanner))

        return cell
    }
}

private extension UICollectionViewLayout {
    static var layout: UICollectionViewFlowLayout {
        let sectionInset = 16.0
        let horizontalSpacing = 8.0

        let width = UIScreen.main.bounds.width - (sectionInset * 2)
        let height = (width - horizontalSpacing * 2)/2

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: width, height: height)
        layout.minimumLineSpacing = horizontalSpacing
        layout.sectionInset = .init(top: 0, left: sectionInset, bottom: 0, right: sectionInset)

        return layout
    }
}
