//
//  String+Extension.swift
//  MyStore
//
//  Created by Andrey Carreño on 21/02/24.
//

import Foundation

extension Double {
    
    func formattedWithSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
}
