//
//  HomeProductsDTO.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import Foundation

// MARK: - HomeProductsDTO Struct
struct HomeProductsDTO: Codable {
    let spotlight: [SpotlightItemDTO]
    let products: [ProductDTO]
    let cash: CashDTO
}

// MARK: - Spotlight Item
struct SpotlightItemDTO: Codable {
    let name: String
    let bannerURL: String
    let description: String
}

// MARK: - Product
struct ProductDTO: Codable {
    let name: String
    let imageURL: String
    let description: String
}

// MARK: - Cash
struct CashDTO: Codable {
    let title: String
    let bannerURL: String
    let description: String
}
