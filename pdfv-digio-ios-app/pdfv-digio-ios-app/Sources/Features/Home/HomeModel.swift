//
//  HomeModel.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import Foundation

struct HomeModel {
    let spotlight: [Banner]
    let digioCash: Banner
    let products: [Banner]

    init(from dto: HomeProductsDTO) {
        spotlight = dto.spotlight.map(Banner.init)
        digioCash = .init(from: dto.cash)
        products = dto.products.map(Banner.init)
    }
}

extension HomeModel {
    struct Banner {
        let name: String
        let imageURL: URL?
        let description: String

        init(from dto: SpotlightItemDTO) {
            name = dto.name
            imageURL = .init(string: dto.bannerURL)
            description = dto.description
        }

        init(from dto: ProductDTO) {
            name = dto.name
            imageURL = .init(string: dto.imageURL)
            description = dto.description
        }

        init(from dto: CashDTO) {
            name = dto.title
            imageURL = .init(string: dto.bannerURL)
            description = dto.description
        }
    }
}
