//
//  HomePresenter.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 17/08/24.
//

import Foundation

final class HomePresenter {

    private let service: HomeServiceable
    private(set) var model: HomeModel?

    private weak var delegate: HomeViewControllerDelegate?

    init(service: HomeServiceable = HomeService()) {
        self.service = service
    }

    func set(delegate: HomeViewControllerDelegate) {
        self.delegate = delegate
    }

    func fetchProducts() {
        do {
            try service.fetchProducts { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let products):
                        self?.model = products
                        self?.delegate?.didFetchProducts()

                    case .failure(let failure):
                        print("failed")
                    }
                }

            }
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
