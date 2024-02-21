//
//  HomeMockInteractor.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

@testable import MyStore

class HomeMockInteractor: PresenterToInteractorHomeProtocol {
    
    enum Invocations {
        case fetchProductsCalled
        case fetchProductsSucces
        case fetchProductsFailed
    }
    
    var invocations: [Invocations] = []
    var presenter: InteractorToPresenterHomeProtocol?
    
    func fetchProducts(query: String) {
        invocations.append(.fetchProductsCalled)
    }
    
}
extension HomeMockInteractor: ProductServicesOuputDelegate {
    
    func fetchProducts(products: [MyStore.Product]) {
        invocations.append(.fetchProductsSucces)
    }
    
    func fetchProductsFailed(error: String) {
        invocations.append(.fetchProductsFailed)
    }

}
