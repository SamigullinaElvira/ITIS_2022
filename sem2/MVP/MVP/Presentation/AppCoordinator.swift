//
//  AppCoordinator.swift
//  MVP
//
//  Created by Эльвира Самигуллина on 11.02.2023.
//

import UIKit

class AppCoordinator {
    func startController() -> UIViewController {
        weak var window: UIWindow?
        
        var authorizationService: AuthorizationService
            = MockAutorizationService()

        var cancellables: Set<AnyCancellable> = []
        
        func start() {
            authorizationService.isAuthorizated
                .sink { [weak self] authorized in
                    guard let self else { return }
                    if authorized {
                        
                    }
                }
                .store(in: &cancellables)
        }
    }
}

