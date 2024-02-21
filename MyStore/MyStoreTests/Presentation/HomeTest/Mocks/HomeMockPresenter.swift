//
//  HomeMockPresenter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

@testable import MyStore
import XCTest

class HomeMockPresenter: InteractorToPresenterHomeProtocol {
    
    enum Invocations {
        case productFetchSuccessCalled
        case productFetchFailedCalled
    }
    
    var invocations: [Invocations] = []
    var expectation: XCTestExpectation!
    
    
    func productFetchSuccess(producList: Array<Product>) {
        invocations.append(.productFetchSuccessCalled)
    }
    
    func productFetchFailed(error: String) {
        invocations.append(.productFetchFailedCalled)
    }
    
}
