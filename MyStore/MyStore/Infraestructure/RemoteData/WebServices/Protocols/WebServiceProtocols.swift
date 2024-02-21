//
//  WebServices.swift
//  myStore
//
//  Created by Andrey Carreño on 18/02/24.
//

import Foundation

protocol WebServiceProtocol {
    func get(_ endpoint: APIEndpoint, completion: @escaping (Result<Data, Error>) -> Void)
}
