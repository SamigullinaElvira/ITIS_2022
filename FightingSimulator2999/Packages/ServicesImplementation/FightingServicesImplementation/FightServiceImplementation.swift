//
//  FightServiceImplementation.swift
//  ServicesImplementation
//
//  Created by Эльвира Самигуллина on 25.03.2023.
//

import Combine
import FightingServices
import PlayerServices

public class FightServiceImplementation: FightService {
    public let playerService: PlayerService
    
    public init(playerService: PlayerService) {
        self.playerService = playerService
    }
    
    public var myHealth: AnyPublisher<Int, Never> { _myHealth.eraseToAnyPublisher() }
    public var enemyHealth: AnyPublisher<Int, Never> { _enemyHealth.eraseToAnyPublisher() }
    
    var _myHealth: CurrentValueSubject<Int, Never> = .init(100)
    var _enemyHealth: CurrentValueSubject<Int, Never> = .init(100)
    
    public func startFight() {
        _myHealth.value = 100
        _enemyHealth.value = 100
    }
    
    public func basicAttack() {
        _enemyHealth.value -= 9
        _myHealth.value -= 10
    }
    
    public func magicAttack() {
        _enemyHealth.value -= Int.random(in: 7...15)
        _myHealth.value -= 10
    }
}
