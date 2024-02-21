//
//  ProductDetailMockRouter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

@testable import MyStore

class ProductDetailMockRouter: PresenterToRouterProductDetailProtocol {
    
    enum Invocations {
        case createModuleCalled
    }
    
    var invocations: [Invocations] = []
    
    static func createModule(product: Product) -> ProductDetailViewController {
        ProductDetailViewController()
    }
}
