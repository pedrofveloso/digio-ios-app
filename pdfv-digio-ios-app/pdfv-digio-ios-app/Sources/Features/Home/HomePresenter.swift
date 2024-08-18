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
        delegate?.set(state: .loading)
        do {
            try service.fetchProducts { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let products):
                        self?.model = products
                        self?.delegate?.set(state: .loaded)

                    case .failure(let failure):
                        self?.delegate?.set(state: .error(failure.localizedDescription))
                    }
                }

            }
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
