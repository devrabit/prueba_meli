//
//  SeekerMockView.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

@testable import MyStore

class SeekerMockView: PresenterToViewSeekerProtocol {
    enum Invocations {
    case validateQueryCalled
    }
    
    var invocations: [Invocations] = []
    
    func validateQuery(isValid: Bool) {
        invocations.append(.validateQueryCalled)
    }
    
}
