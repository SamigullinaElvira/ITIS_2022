//
//  AppCoordinator.swift
//  FightingSimulator2999
//
//  Created by Эльвира Самигуллина on 11.03.2023.
//

import UIKit
import FightingServices
import FightingServicesImplementation

class AppCoordinator {
    weak var window: UIWindow?
    var services: ServiceLocator!
    
    static let shared: AppCoordinator = .init()
    
    lazy var fightService: FightService = services.resolve()
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    func showFight() {
        let controller: FightViewController = storyboard.instantiateViewController(identifier: "FightViewController")
        let presenter = FightPresenter(fightService: fightService)
        controller.presenter = presenter
        presenter.view = controller
        window?.rootViewController = controller
    }
    
    func showResult() {
        let controller: ResultViewController = storyboard.instantiateViewController(identifier: "ResultViewController")
        window?.rootViewController = controller
    }
}
