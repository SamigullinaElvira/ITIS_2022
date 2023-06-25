//
//  AppConfigurator.swift
//  FightingSimulator2999
//
//  Created by Эльвира Самигуллина on 25.03.2023.
//

import Foundation
import PlayerServices
import FightingServices
import PlayerServicesImplementation
import FightingServicesImplementation

class AppConfigurator {
    func configure() -> ServiceLocator {
        let locator = ServiceLocator()
        let playerService: PlayerService = PlayerServiceImplementation() as! PlayerService
        let fightService: FightService = FightServiceImplementation(playerService: playerService)
        locator.register { () -> FightService in
            fightService
        }
        return locator
    }
}
