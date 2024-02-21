//
//  HomeInteractorTest.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

import XCTest
@testable import MyStore

class HomeInteractorTests: XCTestCase {
    
    var mockPresenter: HomeMockPresenter!
    var mockProductServices: ProductServicesMock!
    var sut: HomeInteractor!
    
    override func setUp() {
        super.setUp()
        mockPresenter = HomeMockPresenter()
        mockProductServices = ProductServicesMock()
        sut = HomeInteractor()
        mockProductServices.delegate = sut
        sut.productServices = mockProductServices
        sut.presenter = mockPresenter
    }
    
    override func tearDown() {
        super.tearDown()
        
        mockPresenter = nil
        sut = nil
        
    }
    
    func test_fetchProductsSuccess() {
        //Given
        let expected: [HomeMockPresenter.Invocations] = [.productFetchSuccessCalled]
        //When
        sut.fetchProducts(query: "dsad")
        //Then
        XCTAssertEqual(expected,  mockPresenter.invocations)
    }
    
    func test_fetchProductsFailed() {
        //Given
        let expected: [HomeMockPresenter.Invocations] = [.productFetchFailedCalled]
        //When
        sut.fetchProducts(query: "")
        //Then
        XCTAssertEqual(expected,  mockPresenter.invocations)
    }
    
    func test_fetchProducts() {
        //Given
        let expected: [ProductServicesMock.Invocations] = [.getProductsByQueryCalled]
        //When
        sut.fetchProducts(query: "")
        //Then
        
        XCTAssertEqual(expected, mockProductServices.invocations)
    }
    
}
