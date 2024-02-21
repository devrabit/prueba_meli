//
//  ProductDetailProtocols.swift
//  MyStore
//
//  Created by Andrey Carreño on 21/02/24.
//

import Foundation
protocol ViewToPresenterProductDetailProtocol : AnyObject {
    var view: PresenterToViewProductDetailProtocol? {get set}
    var interactor: PresenterToInteractorProductDetailProtocol? {get set}
    var router: PresenterToRouterProductDetailProtocol? {get set}
    var product: Product? {get set}
    
    func getProductDetail()
    func getRowsTable()
}

protocol PresenterToViewProductDetailProtocol: AnyObject {
    func getProduct(product: Product?)
    func getDataTable(container: [ProductDetailCellModel])
}

protocol PresenterToRouterProductDetailProtocol: AnyObject {
    static func createModule(product: Product) -> ProductDetailViewController
}

protocol PresenterToInteractorProductDetailProtocol: AnyObject {
    var presenter:InteractorToPresenterProductDetailProtocol? {get set}
}

protocol InteractorToPresenterProductDetailProtocol: AnyObject {}
