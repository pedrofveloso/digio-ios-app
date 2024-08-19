//
//  HomeServiceMock.swift
//  pdfv-digio-ios-appTests
//
//  Created by Pedro Veloso on 19/08/24.
//

import Foundation
@testable import pdfv_digio_ios_app

final class HomeServiceMock: HomeServiceable {

    var fetchCount = 0
    var shouldFail = false

    var expectationCompletion: () -> Void = {}

    func fetchProducts(_ completion: @escaping (Result<HomeModel, any Error>) -> Void) throws {

        if shouldFail {
            completion(.failure(NSError(domain: "mocked error", code: -1)))
        } else {

            completion(.success(.mock))
        }

        expectationCompletion()
    }
}
