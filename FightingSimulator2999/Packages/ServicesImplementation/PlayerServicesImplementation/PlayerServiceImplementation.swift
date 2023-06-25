//
//  PlayerServiceImplementation.swift
//  
//
//  Created by Эльвира Самигуллина on 25.03.2023.
//

import PlayerServices

public class PlayerServiceImplementation: PlayerService {
    public var defaultHealth: Int
    
    public init() {
        self.defaultHealth = 100
    }
}
