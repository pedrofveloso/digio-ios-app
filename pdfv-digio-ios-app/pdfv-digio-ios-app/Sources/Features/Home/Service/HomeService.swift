//
//  HomeService.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import Foundation

protocol HomeServiceable {
    func fetchProducts(_ completion: @escaping (Result<HomeModel, Error>) -> Void) throws
}

final class HomeService: HomeServiceable {
    private let client: NetworkClient

    init(client: NetworkClient = NetworkClient()) {
        self.client = client
    }

    func fetchProducts(_ completion: @escaping (Result<HomeModel, Error>) -> Void) throws {
        guard let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
            throw URLError(.badURL)
        }

        client.fetch(url: url) { (result: Result<HomeProductsDTO, Error>) in
            switch result {
            case .success(let dto):
                completion(.success(.init(from: dto)))

            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
