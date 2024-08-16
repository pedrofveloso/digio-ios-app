//
//  ViewCodable.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 16/08/24.
//

import Foundation

protocol ViewCodable {
    func setupSubviews()
    func setupConstraints()
    func setupCompletion()
}

extension ViewCodable {
    func setup() {
        setupSubviews()
        setupConstraints()
        setupCompletion()
    }
    
    func setupCompletion() {
        // making this function optional
    }
}
