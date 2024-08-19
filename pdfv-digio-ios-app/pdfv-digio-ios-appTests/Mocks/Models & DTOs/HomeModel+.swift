//
//  HomeModel+.swift
//  pdfv-digio-ios-appTests
//
//  Created by Pedro Veloso on 19/08/24.
//

import Foundation
@testable import pdfv_digio_ios_app

extension HomeModel: Equatable {
    static var mock: Self {
        .init(from: .mock)
    }

    public static func == (lhs: HomeModel, rhs: HomeModel) -> Bool {
        lhs.spotlight == rhs.spotlight &&
        lhs.digioCash == rhs.digioCash &&
        lhs.products == rhs.products
    }
}

extension HomeModel.Banner: Equatable {
    public static func == (lhs: HomeModel.Banner, rhs: HomeModel.Banner) -> Bool {
        lhs.name == rhs.name &&
        lhs.imageURL?.absoluteString == rhs.imageURL?.absoluteString &&
        lhs.description == rhs.description
    }
}
