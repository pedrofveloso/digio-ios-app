//
//  HomeCollectionView.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

final class HomeCollectionView<T: UICollectionViewCell>: UICollectionView, UICollectionViewDataSource {

    private var banners = [HomeModel.Banner]()

    init(layout: UICollectionViewFlowLayout) {

        super.init(frame: .zero, collectionViewLayout: layout)

        register(T.self, forCellWithReuseIdentifier: "\(T.self)")

        dataSource = self

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
        let sectionInset = 24.0
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
