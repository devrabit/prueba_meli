//
//  ProductServicesDelegate.swift
//  myStore
//
//  Created by Andrey Carreño on 18/02/24.
//

import Foundation
protocol ProductServicesOuputDelegate: AnyObject {
    func fetchProducts(products: [Product])
    func fetchProductsFailed(error: String)
}

protocol ProductServicesProtocol: AnyObject {
    var delegate: ProductServicesOuputDelegate? { get set } 
    func getProductsByQuery(with query: String)
}
