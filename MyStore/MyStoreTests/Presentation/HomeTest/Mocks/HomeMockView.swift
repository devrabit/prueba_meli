//
//  HomeMockView.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

@testable import MyStore

class HomeMockView: PresenterToViewHomeProtocol {
    enum Invocations {
        case onProductResponseSuccessCalled
        case onMovieResponseFailedCalled
    }
    
    var invocations: [Invocations] = []
    
    func onProductResponseSuccess(producList: Array<Product>) {
        invocations.append(.onProductResponseSuccessCalled)
    }
    
    func onMovieResponseFailed(error: String) {
        invocations.append(.onMovieResponseFailedCalled)
    }
}
