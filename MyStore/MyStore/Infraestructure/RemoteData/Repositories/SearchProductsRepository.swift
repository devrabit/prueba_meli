//
//  SearchRepository.swift
//  myStore
//
//  Created by Andrey Carreño on 18/02/24.
//

import Foundation
protocol SearchRepositoryProtocol {
    func searchItems(with query: String, completion: @escaping (Result<SearchResponse, RepositoryError>) -> Void)
}
class SearchRepository: SearchRepositoryProtocol {
    private let webService: WebServiceProtocol
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    func searchItems(with query: String, completion: @escaping (Result<SearchResponse, RepositoryError>) -> Void) {
        webService.get(.searchItems(query: query)) { result in
            switch result {
            case .success(let data):
                do {
                    let reponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(.success(reponse))
                } catch {
                    completion(.failure(.networkError(error)))
                }
            case .failure(let error):
                completion(.failure(.networkError(error)))
            }
        }
    }
}
