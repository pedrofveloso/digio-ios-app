//
//  HomePresenterTests.swift
//  pdfv-digio-ios-appTests
//
//  Created by Pedro Veloso on 19/08/24.
//

import XCTest
@testable import pdfv_digio_ios_app

final class HomePresenterTests: XCTestCase {
    var delegate: HomeViewControllerMock?
    var service: HomeServiceMock?
    var sut: HomePresenter?

    override func setUp() async throws {
        delegate = HomeViewControllerMock()
        service = HomeServiceMock()
        sut = HomePresenter(service: service!)
    }

    func testFetchProducts_WhenSucceed_ShouldSetDelegateStateToLoadedWithCorrectProducts() throws {
        let service = try XCTUnwrap(service)
        let delegate = try XCTUnwrap(delegate)
        let sut = try XCTUnwrap(sut)

        let serviceExpectation = expectation(description: "[mock service] fetch products is called")
        let delegateExpectation = expectation(description: "[mock delegate] set delegate is called")

        service.expectationCompletion = { serviceExpectation.fulfill() }
        delegate.expectationCompletion = { delegateExpectation.fulfill() }

        sut.set(delegate: delegate)
        sut.fetchProducts()

        waitForExpectations(timeout: 5)

        XCTAssertTrue(delegate.didSetDelegate)

        if case .loaded(let model) = delegate.stateToBeSet {
            XCTAssertEqual(model, .mock)
        } else {
            XCTFail("The state sent to delegate should be .loaded instead of \(delegate.stateToBeSet.debugDescription)")
        }
    }

    func testFetchProducts_WhenFailed_ShouldSetDelegateStateToError() throws {
        let service = try XCTUnwrap(service)
        let delegate = try XCTUnwrap(delegate)
        let sut = try XCTUnwrap(sut)

        let delegateExpectation = expectation(description: "[mock delegate] set delegate is called")

        delegate.expectationCompletion = { delegateExpectation.fulfill() }

        service.shouldFail = true

        sut.set(delegate: delegate)
        sut.fetchProducts()

        waitForExpectations(timeout: 4)

        if case .error(let error) = delegate.stateToBeSet {
            XCTAssertEqual(error, "The operation couldn’t be completed. (mocked error error -1.)")
        } else {
            XCTFail("The state sent to delegate should be .error instead of \(delegate.stateToBeSet.debugDescription)")
        }
    }
}
