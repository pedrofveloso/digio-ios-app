//
//  HomeProductsDTO+.swift
//  pdfv-digio-ios-appTests
//
//  Created by Pedro Veloso on 19/08/24.
//

import Foundation
@testable import pdfv_digio_ios_app

extension HomeProductsDTO {
    static var mock: Self {
        .init(spotlight: [.mock], products: [.mock], cash: .mock)
    }
}

extension SpotlightItemDTO {
    static var mock: Self {
        .init(
            name: "Spotlight",
            bannerURL: "spotlight.banner.url",
            description: "Spotlight Description"
        )
    }
}

extension ProductDTO {
    static var mock: Self {
        .init(
            name: "Product",
            imageURL: "product.image.url",
            description: "Product Description"
        )
    }
}

extension CashDTO {
    static var mock: Self {
        .init(
            title: "Cash",
            bannerURL: "cash.banner.url",
            description: "Cash Description"
        )
    }
}
