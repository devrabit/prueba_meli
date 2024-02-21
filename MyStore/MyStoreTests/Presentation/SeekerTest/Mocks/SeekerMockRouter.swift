//
//  SeekerMockRouter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 21/02/24.
//

import UIKit
@testable import MyStore

class SeekerMockRouter: PresenterToRouterSeekerProtocol {
    
    enum Invocations {
    case disapearToHomeCalled
    }
    
    var invocations: [Invocations] = []
    
    static func createModule(delegate: PresenterToPresenterSeekerProtocol) -> SeekerViewController {
        SeekerViewController()
    }
    
    func disapearToHome(query: String, view: UIViewController) {
        invocations.append(.disapearToHomeCalled)
    }
    
}
