//
//  Enpoints.swift
//  myStore
//
//  Created by Andrey Carreño on 18/02/24.
//

import Foundation
enum APIEndpoint {
    case searchItems(query: String)
    
    var url: URL {
        switch self {
        case .searchItems(let query):
            return URL(string: "https://api.mercadolibre.com/sites/MLA/search?q=\(query)")!
        }
    }
}
