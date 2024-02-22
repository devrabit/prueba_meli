//
//  ProductTest.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 22/02/24.
//

import XCTest
@testable import MyStore

class ProductTest: XCTestCase {
    
    var sut: Product!
    
    override func setUp() {
        super.setUp()
        sut = Product(id: "", attributes: [])
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetPriceWithFormat() {
        // Given
        let expected: String = "$5,000"
        sut.price = 5000
        //When
        let result = sut.getPriceWithFormat()
        //Then
        XCTAssertEqual(expected, result)
    }
    
    func testGetOriginaPriceWithFormat() {
        // Given
        let expected: String = "$6,000"
        sut.price = 6000
        //When
        let result = sut.getOriginaPriceWithFormat()
        //Then
        XCTAssertEqual(expected, result)
    }
}


