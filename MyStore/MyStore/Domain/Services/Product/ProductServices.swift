//
//  ProtuctServices.swift
//  myStore
//
//  Created by Andrey Carreño on 18/02/24.
//

import Foundation
class ProductServices: ProductServicesProtocol {
    
    var repository: SearchRepositoryProtocol = SearchRepository(webService: URLSesionWebService())
    weak var delegate: ProductServicesOuputDelegate?
    
    init(delegate: ProductServicesOuputDelegate) {
        self.delegate = delegate
    }
    
    func getProductsByQuery(with query: String) {
        repository.searchItems(with: query) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                delegate?.fetchProducts(products: success.results ?? [])
            case .failure(let failure):
                print(failure.localizedDescription)
                delegate?.fetchProductsFailed(error: "Error al consultar los datos")
            }
        }
    }
    
}
