//
//  MockProductsRepository.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

import Foundation
@testable import MyStore
import XCTest

class SearchRepositoryMock: SearchRepositoryProtocol {
    enum Invocations {
        case searchItems
    }
    var invocations: [Invocations] = []
    
    func searchItems(with query: String, completion: @escaping (Result<MyStore.SearchResponse, MyStore.RepositoryError>) -> Void) {
        
        invocations.append(.searchItems)
        if !query.isEmpty {
            completion(.success(SearchResponse()))
        } else {
            completion(.failure(.genericError))
        }
    }
    
}
