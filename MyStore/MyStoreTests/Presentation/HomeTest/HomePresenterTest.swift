//
//  HomePresenterTest.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

import XCTest
@testable import MyStore

class HomePresenterTests: XCTestCase {

    var mockView: HomeMockView!
    var mockRouter: HomeMockRouter!
    var mockInteractor: HomeMockInteractor!
    var sut: HomePresenter!
    
    override func setUp(){
        super.setUp()
        mockView = HomeMockView()
        mockRouter = HomeMockRouter()
        mockInteractor = HomeMockInteractor()
        sut = HomePresenter()
        sut.view = mockView
        sut.router = mockRouter
        sut.interactor = mockInteractor
    }
    
    override func tearDown() {
        super.tearDown()
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        sut = nil
    }
    
    func test_startFetchingProducts(){
        //Given
        let expected: [HomeMockInteractor.Invocations] = [.fetchProductsCalled]
        //When
        sut.startFetchingProducts(query: "")
        //Then
        XCTAssertEqual(expected, mockInteractor.invocations)
    }
    
    func test_onProductResponseSuccess(){
        //Given
        let expected: [HomeMockView.Invocations] = [.onProductResponseSuccessCalled]
        //When
        sut.onProductResponseSuccess(producList: [])
        //Then
        XCTAssertEqual(expected, mockView.invocations)
    }
    
    func test_openSeeker(){
        //Given
        let expected: [HomeMockRouter.Invocations] = [.openSeekerCalled]
        //When
        sut.openSeeker(navigationController: UINavigationController())
        //Then
        XCTAssertEqual(expected, mockRouter.invocations)
    }
    
    func test_showProducDetail(){
        //Given
        let expected: [HomeMockRouter.Invocations] = [.pushProductDetailCalled]
        //When
        sut.showProducDetail(product:DummyData.product, navigation: UINavigationController())
        //Then
        XCTAssertEqual(expected, mockRouter.invocations)
    }
    
    struct DummyData {
        static let product = Product(id: nil, site_id: nil, title: nil, price: nil, sale_price: nil, currency_id: nil, available_quantity: nil, sold_quantity: nil, buying_mode: nil, listing_type_id: nil, stop_time: nil, condition: nil, permalink: nil, thumbnail: nil, thumbnail_id: nil, accepts_mercadopago: nil, attributes: [], original_price: nil, category_id: nil, official_store_id: nil, domain_id: nil, catalog_product_id: nil, tags: nil, catalog_listing: nil, use_thumbnail_id: nil, order_backend: nil)
    }
}

