//
//  ResponseSearch.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/02/24.
//

import Foundation

struct SearchResponse: Codable {
    var site_id: String?
    var query: String?
    var results: [Product]?
}
