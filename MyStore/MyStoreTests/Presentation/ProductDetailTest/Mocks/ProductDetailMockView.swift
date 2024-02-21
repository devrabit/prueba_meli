//
//  ProductDetailMockView.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

@testable import MyStore

class ProductDetailMockView: PresenterToViewProductDetailProtocol {
    
    enum Invocations {
        case getProductCalled
        case getDataTableCalled
    }
    
    var invocations: [Invocations] = []
    
    func getProduct(product: Product?) {
        invocations.append(.getProductCalled)
    }
    
    func getDataTable(container: [ProductDetailCellModel]) {
        invocations.append(.getDataTableCalled)
    }
    
}
