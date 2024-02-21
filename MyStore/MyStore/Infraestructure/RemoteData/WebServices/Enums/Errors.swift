//
//  Errors.swift
//  myStore
//
//  Created by Andrey Carreño on 18/02/24.
//

import Foundation
enum RepositoryError: Error {
    case networkError(Error)
    case genericError
}
