//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Эльвира Самигуллина on 11.03.2023.
//

import UIKit
import Combine
import FightingServices

class FightPresenter {
    var fightService: FightService
    
    weak var view: FightViewController?
    
    var cancellables: Set<AnyCancellable> = []
    
    init(fightService: FightService) {
        fightService.enemyHealth.receive(on: DispatchQueue.main)
            .sink { [weak self] enemyHealth in
                guard let self else { return }
                
                if enemyHealth <= 0 {
                    return
                } else {
                    self.view?.enemyHealthProgressUpdate(enemyHealth: enemyHealth)                }
               
            }.store(in: &cancellables)
        
        fightService.myHealth.receive(on: DispatchQueue.main)
            .sink { [weak self] myHealth in
                guard let self else { return }
                
                if myHealth <= 0 {
                    return
                } else {
                    self.view?.myHealthProgressUpdate(myHealth: myHealth)
                }
            }.store(in: &cancellables)
    }
    
    func basicAttacked() {
        fightService.basicAttack()
    }
    
    func magicAttacked() {
        fightService.magicAttack()
    }
}
