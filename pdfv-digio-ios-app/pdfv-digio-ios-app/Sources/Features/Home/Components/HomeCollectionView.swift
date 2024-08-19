//
//  HomeCollectionView.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

final class HomeCollectionView<T: UICollectionViewCell>: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    private var banners = [HomeModel.Banner]()

    private weak var parent: UIViewController?

    private let action: BannerAction

    init(layout: UICollectionViewFlowLayout, action: @escaping BannerAction) {
        self.action = action

        super.init(frame: .zero, collectionViewLayout: layout)

        register(T.self, forCellWithReuseIdentifier: "\(T.self)")
        dataSource = self
        delegate = self
        showsHorizontalScrollIndicator = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(banners: [HomeModel.Banner]) {
        self.banners = banners
        reloadData()
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath)

        guard let imageUrl = banners[indexPath.row].imageURL,
              let banner = cell as? Banner else { return cell }

        banner.downloadImage(from: imageUrl)

        return cell
    }

    // MARK: - UICollectionViewDelegate methods

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let banner = banners[indexPath.row]
        action(banner)
    }
}

extension UICollectionViewLayout {
    static var homeSpotlight: UICollectionViewFlowLayout {
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

    static var homeProducts: UICollectionViewFlowLayout {
        let sectionInset = 36.0
        let horizontalSpacing = 16.0

        let width = 100
        let height = 100

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: width, height: height)
        layout.minimumLineSpacing = horizontalSpacing
        layout.sectionInset = .init(top: 0, left: sectionInset, bottom: 0, right: sectionInset)

        return layout
    }
}
