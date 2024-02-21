//
//  URLSesionWebService.swift
//  myStore
//
//  Created by Andrey Carreño on 18/02/24.
//

import Foundation

class URLSesionWebService: WebServiceProtocol {
    func get(_ endpoint: APIEndpoint, completion : @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: endpoint.url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                guard response is HTTPURLResponse else {
                    fatalError("Unsupported protocol")
                }
                if let data = data {
                    completion(.success(data))
                }
            }
        }.resume()
    }
}
