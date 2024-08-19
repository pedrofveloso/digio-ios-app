//
//  HomePresenter.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 17/08/24.
//

import Foundation

final class HomePresenter {
    private let service: HomeServiceable

    private weak var delegate: HomeViewControllerDelegate?

    init(service: HomeServiceable) {
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
                        self?.delegate?.set(state: .loaded(products))

                    case .failure(let failure):
                        self?.delegate?.set(state: .error(failure.localizedDescription))
                    }
                }
            }
        } catch {
            delegate?.set(state: .error(error.localizedDescription))
        }
    }
}
