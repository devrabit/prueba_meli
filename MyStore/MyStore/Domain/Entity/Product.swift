//
//  ProductEntity.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/02/24.
//

import Foundation
struct Product: Codable {
    
    let id: String?
    let site_id: String?
    let title: String?
    let price: Double?
    let sale_price: String?
    let currency_id: String?
    let available_quantity: Int?
    let sold_quantity: Int?
    let buying_mode: String?
    let listing_type_id: String?
    let stop_time: String?
    let condition: String?
    let permalink: String?
    let thumbnail: String?
    let thumbnail_id: String?
    let accepts_mercadopago: Bool?
    let attributes: [Attribute]
    let original_price: Double?
    let category_id: String?
    let official_store_id: Int?
    let domain_id: String?
    let catalog_product_id: String?
    let tags: [String]?
    let catalog_listing: Bool?
    let use_thumbnail_id: Bool?
    let order_backend: Int?
    
    func getPriceWithFormat() -> String {
        "$\((price?.formattedWithSeparator() ?? ""))"
    }
 
    func getOriginaPriceWithFormat() -> String {
        "$\((original_price?.formattedWithSeparator() ?? ""))"
    }
    
}
