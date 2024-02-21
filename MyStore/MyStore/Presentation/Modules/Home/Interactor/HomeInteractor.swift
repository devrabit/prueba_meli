//
//  HomeInteractor.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/02/24.
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    weak var presenter: InteractorToPresenterHomeProtocol?
    var productServices: ProductServicesProtocol?
    
    init() {
        productServices = ProductServices(delegate: self)
    }
    
    func fetchProducts(query: String) {
        productServices?.getProductsByQuery(with: query)
    }
    
}
extension HomeInteractor: ProductServicesOuputDelegate {
    
    func fetchProducts(products: [Product]) {
        self.presenter?.productFetchSuccess(producList: products)
    }
    
    func fetchProductsFailed(error: String) {
        presenter?.productFetchFailed(error: error)
    }
    
}
